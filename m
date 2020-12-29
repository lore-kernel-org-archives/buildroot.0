From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 15:05:47 +0100
Subject: [Buildroot] [PATCH v2 00/14] packages: Add SELinux modules to
 some packages
In-Reply-To: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
References: <20201228161134.303992-1-maxime.chevallier@bootlin.com>
Message-ID: <20201229140547.GM1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2020-12-28 17:11 +0100, Maxime Chevallier spake thusly:
> This is the second iteration of the series adding matching between
> packages and the SELinux refpolicy module that supports them.

Series applied to master, thanks. I did some tweaks to one patch, I'll
be replying separately to that one.

Regards,
Yann E. MORIN.

> Maxime
> 
> Maxime Chevallier (14):
>   package/iwd: add SELinux module
>   package/network-manager: add SELinux module
>   package/wpa_supplicant: add SELinux module
>   package/ebtables: add SELinux module
>   package/ipset: add SELinux module
>   package/iptables: add SELinux module
>   package/nftables: add SELinux module
>   package/fping: add SELinux module
>   package/iputils: add SELinux module
>   package/mtr: add SELinux module
>   package/nmap: add SELinux module
>   package/tcpdump: add SELinux module
>   package/haveged: add SELinux module
>   package/jitterentropy-library: add SELinux module
> 
>  package/ebtables/ebtables.mk                     |  1 +
>  package/fping/fping.mk                           |  1 +
>  package/haveged/haveged.mk                       |  1 +
>  package/ipset/ipset.mk                           |  1 +
>  package/iptables/iptables.mk                     |  2 ++
>  package/iputils/iputils.mk                       | 16 ++++++++++++++++
>  package/iwd/iwd.mk                               |  1 +
>  .../jitterentropy-library.mk                     |  1 +
>  package/mtr/mtr.mk                               |  1 +
>  package/network-manager/network-manager.mk       |  1 +
>  package/nftables/nftables.mk                     |  1 +
>  package/nmap/nmap.mk                             |  1 +
>  package/tcpdump/tcpdump.mk                       |  1 +
>  package/wpa_supplicant/wpa_supplicant.mk         |  1 +
>  14 files changed, 30 insertions(+)
> 
> -- 
> 2.25.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
