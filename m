From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Sep 2016 11:47:45 -0300
Subject: [Buildroot] [PATCH] configs/warp7: Add Wifi support
In-Reply-To: <87bmzi3fxc.fsf@dell.be.48ers.dk>
References: <1474314302-19064-1-git-send-email-festevam@gmail.com>
 <87bmzi3fxc.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5BAxCYYwKeDubLaJXYXPRff0PytvusajmtF_v+NLOc9Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 20, 2016 at 9:37 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

> We recently had a discussion about this .txt file in the context of
> rpi3. How specific to warp7 is this file? Is there some documentation

I just used the txt file provided in the NXP BSP.

> somewhere explaining what all these settings do?

Unfortunately I don't see any explanation about it.

>> @@ -0,0 +1,42 @@
>  > +# 2.4 GHz, 20 MHz BW mode
>  > +manfid=0x2d0
>  > +prodid=0x0726
>  > +vendid=0x14e4
>  > +devid=0x43e2
>  > +boardtype=0x0726
>  > +boardrev=0x1202
>  > +boardnum=22
>  > +macaddr=00:90:4c:c5:12:38
>
> Does this mean that all warp7 boards will use the same macaddr? This

No, the real MAC address I see is different from the one in the .txt file:

wlan0     Link encap:Ethernet  HWaddr 00:AE:FA:8D:95:E5
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
