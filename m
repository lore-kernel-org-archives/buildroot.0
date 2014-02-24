From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 00:41:14 +0100
Subject: [Buildroot] [PATCH] gst-fsl-plugins: add missing librt linking
	for libgstfsl.
In-Reply-To: <1393267845-15148-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Mon, 24 Feb 2014 19:50:45 +0100")
References: <1393267845-15148-1-git-send-email-ps.report@gmx.net>
Message-ID: <87ha7okrj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes runtime failure of gst-fsl-plugins, e.g.
 > (gst-plugin-scanner:1700): GStreamer-WARNING **: Failed to load
 >         plugin '/usr/lib/gstreamer-0.10/libmfw_vpu.so':
 >         /usr/lib/libgstfsl-0.10.so.0: undefined symbol: shm_open)

 > when compiled with buildroot/glibc toolchain.

 > See also old buildroot mailing list request [1].

 > [1] http://lists.busybox.net/pipermail/buildroot/2013-June/073910.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
