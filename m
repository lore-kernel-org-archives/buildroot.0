From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 23:04:06 +0200
Subject: [Buildroot] [PATCH v4 03/12] arc: Add option for ARC-specific
	download site
In-Reply-To: <1367524293-32081-4-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 2 May 2013 21:51:24 +0200")
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-4-git-send-email-mjonker@synopsys.com>
Message-ID: <87obcqqwxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> As ARC support is not yet in all upstream packages, a different
 Mischa> location is required to download the packages from. This adds
 Mischa> an option to specify a site for ARC-specific versions of
 Mischa> packages such as binutils, gcc.

 Mischa> When ARC support has been upstreamed for all packages, this
 Mischa> option can be removed again.

 Mischa> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
