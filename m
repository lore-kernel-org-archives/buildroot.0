From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Feb 2017 13:35:33 +0100
Subject: [Buildroot] [PATCH 3/3] gstreamer1: drop unused configure time
	unaligned access handling logic
In-Reply-To: <20170218110616.GC3632@free.fr> (Yann E. MORIN's message of "Sat, 
 18 Feb 2017 12:06:16 +0100")
References: <20170218092550.29810-1-peter@korsgaard.com>
 <20170218092550.29810-3-peter@korsgaard.com>
 <20170218094242.GA3632@free.fr> <87a89ju5r1.fsf@dell.be.48ers.dk>
 <20170218110616.GC3632@free.fr>
Message-ID: <8760k7u162.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> > So I think this patch should come before you fix or1k, i.e. swap patches
 >> > 2 and 3, no?
 >> 
 >> No, I think you are mixing up gstreamer and gstreamer1.

 > No, I don't think so...

 >> Patch 1 fixes gstreamer by adding or1k to the configure handling
 >> Patch 2 fixes gstreamer1 by adding a patch fixing gst/gstconfig.h

 > Here you patch package/gstreamer1/gstreamer1/gstreamer1.mk to also
 > apply the as_cv_unaligned_access=no in the or1k case, but...

Gaah, you are right - I apparently ended up doing a commit -a. I'll fix
that.

-- 
Bye, Peter Korsgaard
