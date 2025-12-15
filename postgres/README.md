# BluePill Module: PostgreSQL Database

**Purpose:** Isolated PostgreSQL database for development  
**Port:** 5432  
**Database:** `makerx_dev`  
**User:** `makerx` / `makerx123`

---

## Quick Start

**Provision via Matrix Console:**
```
Type: 🔵 Module
Name: postgres
Port: 5432
Template: Build from templates/postgres/setup.sh
```

**Connection String:**
```
postgresql://makerx:makerx123@localhost:5432/makerx_dev
```

---

## Using from Prisma

Update `makerx-bluepill/.env.local`:
```env
DATABASE_URL="postgresql://makerx:makerx123@localhost:5432/makerx_dev"
```

Run migrations:
```bash
cd makerx-bluepill
npx prisma db push
```

---

## Customization

### Change Password
Edit `setup.sh` line with password:
```bash
sudo -u postgres psql -c "CREATE USER makerx WITH ENCRYPTED PASSWORD 'your-secure-password';"
```

### Add pgvector Extension
```bash
sudo -u postgres psql -d makerx_dev -c "CREATE EXTENSION vector;"
```

### Enable Logging
```bash
sudo bash -c "echo \"log_statement = 'all'\" >> /etc/postgresql/*/main/postgresql.conf"
sudo service postgresql restart
```

---

## Backup/Restore

**Backup:**
```bash
wsl -d BluePill-Module-postgres
sudo -u postgres pg_dump makerx_dev > /tmp/backup.sql
exit
wsl -d BluePill-Module-postgres cat /tmp/backup.sql > D:\Backups\db.sql
```

**Restore:**
```bash
wsl -d BluePill-Module-postgres
sudo -u postgres psql makerx_dev < /tmp/backup.sql
```
