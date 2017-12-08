From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 13:35:48 +0100
Subject: [Buildroot] [PATCH 3/8] arm-trusted-firmware: allow to generate
 the BL31 image
In-Reply-To: <20171203214811.3124-4-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:06 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-4-thomas.petazzoni@free-electrons.com>
Message-ID: <87zi6tz9az.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Some platforms (e.g Allwinner ARM64) don't build a FIP image out of
 > ATF, but only a BL31 image, which is then encapsulated in U-Boot. This
 > commit adds an ATF option to build such an image.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
