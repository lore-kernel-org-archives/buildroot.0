From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 17:29:36 +0200
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS48 v3.1 processor
In-Reply-To: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com> (Evgeniy
 Didin's message of "Tue, 4 Jun 2019 08:39:27 +0300")
References: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com>
Message-ID: <87lfwab733.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > This patch introduces recently released significant
 > update to ARC HS family: ARC HS48.

 > One of the major ARC HS48 features is dual-issue pipeline
 > which requires a little bit modified instruction scheduling compared
 > to single-issue cores (HS38), thus new "-mcpu/--with-cpu=hs4x".

 > Also to address some peculiarities of early designs based on
 > HS48 we introduced yet another "-mcpu/--with-cpu=hs4x_rel1" which
 > we're going to use as well on some of our development boards.

 > Note, there is a prerequisite patch:
 > 	https://patchwork.ozlabs.org/patch/995220/

This kind of message should go after the --- line so it doesn't get
included in the commit message.

 > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com

Committed after fixing a number of check-package warnings, thanks.

-- 
Bye, Peter Korsgaard
