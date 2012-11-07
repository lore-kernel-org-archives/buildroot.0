From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Nov 2012 19:53:18 +0100
Subject: [Buildroot] [PATCH 1/1] calao: use zImage on usb-a9263 and
	usb-a9g20 lpw
In-Reply-To: <1344003028-9452-1-git-send-email-plagnioj@jcrosoft.com>
 (Jean-Christophe PLAGNIOL-VILLARD's message of "Fri, 3 Aug 2012
 16:10:28 +0200")
References: <1344003028-9452-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <87bof9dz35.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 J> The board boot more fast with a zImage than a uImage
 J> as the kernel will not have to be relocated during the decompression.

 J> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
