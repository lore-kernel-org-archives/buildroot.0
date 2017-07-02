From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 23:14:25 +0200
Subject: [Buildroot] [PATCH] [PATCH v4] azure-iot-sdk-c: New package
In-Reply-To: <1498144290-13940-1-git-send-email-nerv@dawncrow.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Thu, 22 Jun 2017 17:11:30 +0200")
References: <1498144290-13940-1-git-send-email-nerv@dawncrow.de>
Message-ID: <877ezqa6dq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > Despite newer versions being available, this patch creates a package
 > for version 2017-05-05, because newer version have issues that need to
 > be addressed.
 > Still, the projects install target installs the wrong files, that's
 > why commands are needed for staging_install and target_install.

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
 > ---

 > v2: Rework the package with help from Arnouts comments
 > v3: Explain some things in the commit message
 > v4: Fix commit message as suggested by Thomas

Committed, thanks.

-- 
Bye, Peter Korsgaard
