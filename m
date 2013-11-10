From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 22:41:36 +0100
Subject: [Buildroot] [PATCH] uclibc: fix MIPS variables
In-Reply-To: <1384095702-5268-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 10 Nov 2013 16:01:42 +0100")
References: <1384095702-5268-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9hcc4tr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> The BR2_UCLIBC_MIPS_ISA hidden Config.in variable defines which uClibc
> config option should be enabled for a given MIPS architecture
> variant. Therefore, using lower case names doesn't work: they should
> be upper case, to match uClibc config option names. This commit makes
> sure the mips32, mips32r2 and mips64 builds select the appropriate
> uClibc configuration.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Markos Chandras <Markos.Chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
