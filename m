From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:14:59 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2018.09-rc2
In-Reply-To: <20181120162522.25124-1-Evgeniy.Didin@synopsys.com> (Evgeniy
 Didin's message of "Tue, 20 Nov 2018 19:25:22 +0300")
References: <20181120162522.25124-1-Evgeniy.Didin@synopsys.com>
Message-ID: <87o9ajo0po.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Evgeniy" == Evgeniy Didin <Evgeniy.Didin@synopsys.com> writes:

 > This commit bumps ARC toolchain to arc-2018.09-rc2,
 > which includes significant changes since arc-2018.09-rc1.
 > We want to test how new toolchain-rc2 builds packages,
 > so we can make fixes before release of toolcain.
 > This makes us closer to toolchain release which will be in a few weeks.

 > Please note that it is a release candidate and it might 
 > contain some breakages, please don't use it for production builds.

 > Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: arc-buildroot at synopsys.com
 > ---
 > Important notes:
 > -Please add this patch to next branch

Our normal approach is to add the string 'next' in the the PATCH header
in the subject (E.G. -subject-prefix='PATCH-next' when calling git
send-email).

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
