From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 17:05:08 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Add Wifi support
In-Reply-To: <CAOMZO5BAxCYYwKeDubLaJXYXPRff0PytvusajmtF_v+NLOc9Ug@mail.gmail.com>
 (Fabio Estevam's message of "Tue, 20 Sep 2016 11:47:45 -0300")
References: <1474314302-19064-1-git-send-email-festevam@gmail.com>
 <87bmzi3fxc.fsf@dell.be.48ers.dk>
 <CAOMZO5BAxCYYwKeDubLaJXYXPRff0PytvusajmtF_v+NLOc9Ug@mail.gmail.com>
Message-ID: <87twda1ujf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > On Tue, Sep 20, 2016 at 9:37 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> We recently had a discussion about this .txt file in the context of
 >> rpi3. How specific to warp7 is this file? Is there some documentation

 > I just used the txt file provided in the NXP BSP.

OK.

 >> somewhere explaining what all these settings do?

 > Unfortunately I don't see any explanation about it.

:/

 >>> @@ -0,0 +1,42 @@
 >> > +# 2.4 GHz, 20 MHz BW mode
 >> > +manfid=0x2d0
 >> > +prodid=0x0726
 >> > +vendid=0x14e4
 >> > +devid=0x43e2
 >> > +boardtype=0x0726
 >> > +boardrev=0x1202
 >> > +boardnum=22
 >> > +macaddr=00:90:4c:c5:12:38
 >> 
 >> Does this mean that all warp7 boards will use the same macaddr? This

 > No, the real MAC address I see is different from the one in the .txt file:

Ahh, good. I wonder why it is then listed (twice even) in the .txt file.

-- 
Venlig hilsen,
Peter Korsgaard 
