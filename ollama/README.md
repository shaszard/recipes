# ubuntu-ollama-builder

Auto-captured from virgin Ubuntu instance: `ubuntu-ollama-builder`

## Overview

This template was generated using MakerX's Infrastructure-as-Code capture workflow:
1. Deployed virgin Ubuntu 22.04
2. Manually configured and installed software
3. Captured changes as `setup.sh`
4. Ready for Template Builder

## Files

- **setup.sh** - Installation and configuration script
- **README.md** - This file

## Usage

### Via Template Builder (Recommended)

1. Commit this directory to Git (e.g., `makerx-agent/templates/ubuntu-ollama-builder`)
2. Use Template Builder in WSL Console
3. Point to repository and build .tar template
4. Deploy instances from template

### Manual Testing

```bash
# Deploy fresh Ubuntu
wsl --import test-ubuntu-ollama-builder C:\WSL\test-ubuntu-ollama-builder ubuntu-base.tar.gz

# Run setup script
wsl -d test-ubuntu-ollama-builder bash -c "$(cat setup.sh)"

# Verify
wsl -d test-ubuntu-ollama-builder

# Export as template
wsl --export test-ubuntu-ollama-builder C:\WSL\MakerX\templates\ubuntu-ollama-builder.tar
```

## Customization

Review and modify `setup.sh` before building template:
- Add missing installation commands
- Remove unnecessary packages
- Adjust configuration values
- Add environment variables

## Next Steps

1. **Review**: Check `setup.sh` for accuracy
2. **Test**: Deploy virgin Ubuntu and run script manually
3. **Refine**: Adjust script based on testing
4. **Commit**: Add to Git repository
5. **Build**: Use Template Builder to create .tar
6. **Deploy**: Launch instances from template

---

Generated: 2025-12-14T23:28:56.138Z
