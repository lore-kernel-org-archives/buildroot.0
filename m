From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Thu, 14 Sep 2017 13:19:47 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20170914093209.r5xwd4outafdxrmv@tarshish>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
 <20170914090043.1240-1-alexander.i.mukhin@gmail.com>
 <20170914093209.r5xwd4outafdxrmv@tarshish>
Message-ID: <20170914101947.GB1462@hpx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Sep 14, 2017 at 12:32:09PM +0300, Baruch Siach wrote:
> I don't think these patches are needed. Just use HOSTAPD_CONFIG_SET instead of 
> HOSTAPD_CONFIG_ENABLE. Actually, I think we don't need HOSTAPD_CONFIG_ENABLE 
> at all, only HOSTAPD_CONFIG_SET. But that's for another patch.

Completely agree, the first patch isn't necessary, it just gives a more
pretty-looking defconfig, with all the driver options in the right
order. But yes, we can live without it.
The second patch isn't necessary too, I just wanted a user to have a
complete list of possible drivers in their sample hostapd.conf. So I'd
suggest to keep the second patch.

The updated patch follows.

-- 
Best regards,
Alexander.
