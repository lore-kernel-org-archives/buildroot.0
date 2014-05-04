From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 04 May 2014 15:30:50 +0200
Subject: [Buildroot] [PATCH v3 1/2] infra: Add generic
	check_prog_host	function
In-Reply-To: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <31e5ed31-199f-44eb-98b9-16e527d7a798@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian <maxime.hadjinlian@gmail.com> schreef:
>Avoid copy/pasting the same block of code to check if a program is
>available on the host machine.
>
>Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

As mentioned in the discussion of v1, there are many more improvements possible in dependencies.sh, but these can be done in a later patch...

Best regards,
Thomas
