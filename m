From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 23:10:11 +0200
Subject: [Buildroot] [PATCH v2] ARC: gcc - Fix SIZE_TYPE to be "unsigned
	int" instead of "long unsigned int"
In-Reply-To: <1410792593-422-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Mon, 15 Sep 2014 18:49:53 +0400")
References: <1410792593-422-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87ppev6zm4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
 > type checks.

 > Fix is taken from current development branch of GCC for ARC and will be a
 > part of the next release of ARC tools, so at that point patch should be dropped.

 > https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3

 > Fixes http://autobuild.buildroot.net/results/405/405da9a945511329929b18740b983c51b8dcc43e

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > ---

 > Compared to v1 comment is added in the patch itself with more info on its
 > origin and reasoning.

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
