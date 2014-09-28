From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 22:40:28 +0200
Subject: [Buildroot] [PATCH] tiff: fix prefer-static build by using
	default install
In-Reply-To: <1411697360-20724-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 25 Sep 2014 22:09:20 -0400")
References: <1411697360-20724-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <877g0ntr5v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Replace hand-coded .so install with default install, plus tiff bins fixup
 > to remove unwanted tools.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 > ---

 > The default install also ensures that the destination directory
 > exists before installing to it.  So this patch supercedes the previously
 > submitted patch "tiff: ensure directory exists before installing to it".

Committed, thanks.

-- 
Bye, Peter Korsgaard
