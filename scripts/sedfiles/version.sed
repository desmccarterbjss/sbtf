/^<project.*/ {

:top
	n

	/^[ |	]*<version.*/ {

		s/^[ |	]*<version>\([^<]*\).*/\1/p

		b end

	}

	b top
}

:end
