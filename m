From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 16:06:00 +0100
Subject: [Buildroot] [PATCH] package/pps-tools: bump version to fix
 usage without bash
In-Reply-To: <20181203130354.15752-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 3 Dec 2018 14:03:54 +0100")
References: <20181203130354.15752-1-thomas.petazzoni@bootlin.com>
Message-ID: <878t0pa4vb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As report in bug #11426, the ppsfind shell script uses /bin/bash, but
 > the Buildroot pps-tools package doesn't depend on bash. In fact,
 > upstream has fixed the problem, and the script can now be used with a
 > POSIX shell, and the shebang is /bin/sh.

 > This commit therefore bumps pps-tools to the latest upstream commit,
 > which is precisely this fix.

 > Fixes bug #11426.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
