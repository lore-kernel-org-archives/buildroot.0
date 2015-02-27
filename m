From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 14:48:11 +0100
Subject: [Buildroot] [PATCH] gpm: avoid use of host emacs
In-Reply-To: <5cc51818c93e8e6c44ac6e47e61a858d9f9295da.1425039600.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Feb 2015 14:20:00 +0200")
References: <5cc51818c93e8e6c44ac6e47e61a858d9f9295da.1425039600.git.baruch@tkos.co.il>
Message-ID: <87bnkf31pg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > configure looks for emacs installation to byte compile .el files. This may
 > break the build if the host installed emacs is missing needed dependencies.
 > Since we don't (yet?) package emacs for target, just disable detection of
 > emacs.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
