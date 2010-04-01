From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Apr 2010 12:35:58 +0200
Subject: [Buildroot] [PATCH] matchbox: convert to autotools,
	fix build with start-notification, fix build with libxft
In-Reply-To: <1270116612-6658-1-git-send-email-will_wagner@carallon.com> (Will
	Wagner's message of "Thu, 1 Apr 2010 11:10:12 +0100")
References: <20100325234920.5dae5e04@surf>
	<1270116612-6658-1-git-send-email-will_wagner@carallon.com>
Message-ID: <87aatn8nox.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 Will>  target/device/Carallon/badger/crcgen               |  Bin 0 -> 10094 bytes

You presumably didn't mean to include this?

 Will> diff --git a/target/device/Carallon/badger/crcgen b/target/device/Carallon/badger/crcgen
 Will> new file mode 100755
 Will> index 0000000000000000000000000000000000000000..e597b0aed702dce5d4a4d2fc81de18412c516770

-- 
Bye, Peter Korsgaard
