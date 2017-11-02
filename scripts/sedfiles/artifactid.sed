/^<project.*/ {

:top
	n

	/^[ |	]*<artifactId.*/ {

		s/^[ |	]*<artifactId>\([^<]*\).*/\1/p

		b end

	}

	b top
}

:end
