From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Thu, 14 Sep 2017 13:39:48 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20170914102413.mxajoxtjz2shgkx2@tarshish>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914090043.1240-1-alexander.i.mukhin@gmail.com>
 <20170914093209.r5xwd4outafdxrmv@tarshish>
 <20170914101947.GB1462@hpx>
 <20170914102413.mxajoxtjz2shgkx2@tarshish>
Message-ID: <20170914103948.GC1462@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

 On Thu, Sep 14, 2017 at 01:24:13PM +0300, Baruch Siach wrote
> I don't believe anyone looks at the code under (by default) output/build/ for 
> options. I think that the Config.in entry is enough. The patch is just a 
> maintenance burden, IMO.

Agree on defconfig patch. But the second patch modifies hostapd.conf
which is installed to the target and may be consulted by the user
on the available configuration options.

Anyway, if you think it's not necessary too, then the fewer patches, the
better :)

-- 
Alexander.
