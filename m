From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 21:59:57 +0100
Subject: [Buildroot] [PATCH] barebox: use the symlink to copy the
	barebox binary to the images directory
In-Reply-To: <1353587711-26855-1-git-send-email-gregory.hermant@calao-systems.com>
 (Gregory Hermant's message of "Thu, 22 Nov 2012 13:35:11 +0100")
References: <1353587711-26855-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <87vcc9r5bm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory Hermant <gregory.hermant@calao-systems.com> writes:

 Gregory> Barebox creates a symlink to the binary. This symlink points to
 Gregory> the barebox.bin or to the compressed zbarebox.bin binary.

Committed, thanks.

-- 
Bye, Peter Korsgaard
