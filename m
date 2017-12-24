From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 24 Dec 2017 23:51:29 +0300
Subject: [Buildroot] [PATCH 0/4] hostapd: new configuration options
In-Reply-To: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171224205129.phffy4hbcjd5ctpj@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Below is the list of patches for hostapd to give user more control
> on which options to include in the build. As a byproduct, we can drop
> dependencies on netlink and threads if the options selected
> do not require them.
> 
> Alexander Mukhin (4):
>   hostapd: select VLAN support
>   hostapd: select driver support
>   hostapd: make ACS dependent on nl80211
>   hostapd: drop default netlink dependency

For the whole patch set:
Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
