From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Wed, 27 Dec 2017 22:12:21 +0300
Subject: [Buildroot] [PATCH 2/4] hostapd: select driver support
In-Reply-To: <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
 <20171223190617.3981-3-alexander.i.mukhin@gmail.com>
 <20171224204920.uwyafn63a6lyyqan@speedy.hunter>
Message-ID: <20171227191221.GA579@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

> Does it makes sense to enforce enablement of at least one driver ?
> 
> Another option would be to add DRIVER_NONE to the list of drivers,
> and enable it by default if no other actual wired/wireless driver
> has been selected. According to example hostapd.conf only 'none'
> driver is needed if hostapd is built as a standalone RADIUS server.

Yes, I agree with you.
I'll send a patch for that.

-- 
Cheers,
Alexander.
