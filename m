From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:20:56 +0200
Subject: [Buildroot] [PATCHv3 00/15] DirectFB stack bump
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 2 Sep 2015 00:01:01 +0200")
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4gefot3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is the third version of the DirectFB bump. The previous version
 > was submitted in February by Peter Seiderer, so it's time to move
 > forward on this topic. There are too many changes compared to Peter's
 > version to really list all of them, it's better to think of this
 > series almost as a new one: it combines changes from Peter with
 > changes I had also prepared on my side.

 > The patch series bumps DirectFB, DirectFB-examples and linux-fusion,
 > but also does a number of related cleanups (remove unused/useless
 > options, simplify the DirectFB-examples package, remove no longer
 > useful packages, etc.).

 > I did quite a bit of build testing: I built 10 different Buildroot
 > configurations, to test each of the 10 direct reverse dependencies of
 > DirectFB:

 >  - Cairo
 >  - EFL (libevas and libecore)
 >  - GStreamer 0.10 DirectFB bad plugin
 >  - Gstreamer 1.x DirectFB bad plugin
 >  - Links with DirectFB support
 >  - Lite
 >  - Qt4 with DirectFB backend (required a patch)
 >  - Qt5 with DirectFB backend
 >  - SDL with DirectFB backend
 >  - VLC with DirectFB backend

 > All of them built successfully.

Great, thanks for all the testing. Committed series!

-- 
Bye, Peter Korsgaard
