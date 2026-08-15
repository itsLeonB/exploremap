.PHONY: dev

# Run backend and mobile dev servers together.
dev:
	@trap 'kill 0' EXIT; \
	(cd backend && make run) & \
	(cd mobile && npm start) & \
	wait
