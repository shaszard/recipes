# BluePill Module: Redis Cache

**Purpose:** In-memory cache for AI responses, session data, etc.  
**Port:** 6379  
**Use Case:** Vector cache, tiered AI architecture

---

## Quick Start

**Provision via Matrix Console:**
```
Type: 🔵 Module
Name: redis
Port: 6379
Template: Build from templates/redis/setup.sh
```

**Connection:**
```
redis://localhost:6379
```

---

## Using for AI Caching

**Cache AI responses:**
```typescript
import { createClient } from 'redis';

const redis = createClient({ url: 'redis://localhost:6379' });
await redis.connect();

// Cache OpenAI response
await redis.set('ai:question:hash', JSON.stringify({
  question: "What is TypeScript?",
  answer: "TypeScript is a typed superset of JavaScript...",
  timestamp: Date.now()
}), { EX: 3600 }); // Expires in 1 hour

// Retrieve cached response
const cached = await redis.get('ai:question:hash');
```

**Tiered AI flow:**
```typescript
async function askAI(question: string) {
  const hash = hashQuestion(question);
  
  // 1. Check Redis cache
  const cached = await redis.get(`ai:${hash}`);
  if (cached) return JSON.parse(cached); // FREE, instant
  
  // 2. Ask Ollama
  const local = await askOllama(question);
  if (local.confidence > 0.8) {
    await redis.set(`ai:${hash}`, JSON.stringify(local), { EX: 3600 });
    return local; // FREE, ~2-5 seconds
  }
  
  // 3. Fallback to OpenAI
  const openai = await askOpenAI(question);
  await redis.set(`ai:${hash}`, JSON.stringify(openai), { EX: 86400 }); // Cache 24h
  return openai; // $$, high quality
}
```

---

## Performance

**Cache Hit Rates:**
- 70% cache hits = 70% free queries
- 20% Ollama = 20% free queries
- 10% OpenAI = 10% paid queries

**Cost Savings:**
- Before: 1000 queries × $0.0015 = $1.50/day
- After: 100 queries × $0.0015 = $0.15/day
- **Savings: $1.35/day = $492/year** 💰

---

## Monitoring

**Check stats:**
```bash
redis-cli INFO stats
```

**Monitor commands:**
```bash
redis-cli MONITOR
```

**Check memory:**
```bash
redis-cli INFO memory
```
