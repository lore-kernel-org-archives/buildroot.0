From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 12:35:02 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: select BR2_LEGACY for
	module-init-tools legacy option
In-Reply-To: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Nov 2013 20:09:48 +0100")
References: <1383851388-28586-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjpccwwp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Commit 94c72087f3 ("module-init-tools: remove package") removed the
 > module-init-tools package and therefore added the corresponding config
 > option in Config.in.legacy. However, the commit forgot to add the
 > "select BR2_LEGACY" that ensures the build cannot proceed until the
 > user has acknowledged the change (i.e kmod replacing
 > module-init-tools).

 > This commit adds this missing "select BR2_LEGACY".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
