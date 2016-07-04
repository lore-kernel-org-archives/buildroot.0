From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 11:21:37 +0200
Subject: [Buildroot] [PATCH 3/4] qemu: add support for vde2
In-Reply-To: <1467584664-11640-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 4 Jul 2016 00:24:23 +0200")
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467584664-11640-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zipxiwri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Simon Maes <simonn.maes@gmail.com>
 > Additional configuration for qemu package:
 > - Enable VDE2 support for qemu

 > Signed-off-by: Simon Maes <simonn.maes@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I've tweaked the config text to make it clear this is about host-qemu
and committed, thanks.

-- 
Bye, Peter Korsgaard
