From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 08:54:04 +0100
Subject: [Buildroot] [PATCH] coreutils: add gnulib patch to fix
	librt/libthread link in static case
In-Reply-To: <1392937490-19214-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 21 Feb 2014 00:04:50 +0100")
References: <1392937490-19214-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2igx5nn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > coreutils was no building in the static link case with uClibc, due to

s/no/not/

 > binaries being linked with librt (for timer functions), but not with
 > libpthread. However, librt uses functions from libpthread, so both
 > must be specified. This lack of linking against libpthread was caused
 > to a defiency in one of the gnulib m4 macro, for which we add a patch.

/to a defiency/by a deficiency/

Committed, thanks.

-- 
Bye, Peter Korsgaard
