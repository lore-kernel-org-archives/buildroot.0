From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 09:50:43 +0200
Subject: [Buildroot] [PATCH 5/5] linux: add automatic firewalld config
 selection
In-Reply-To: <20200330234616.1665466-5-aduskett@gmail.com>
References: <20200330234616.1665466-1-aduskett@gmail.com>
 <20200330234616.1665466-5-aduskett@gmail.com>
Message-ID: <20200407075043.GG22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-30 16:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Firewalld requires almost every single nftables rule enabled in the kernel to
> properly start. As such, if a user selects the firewalld package, it is much
> easier to select these options for them, must like we do for systemd or
> iptables.

As for the nftables patch earlier in that series, I've marked this patch
as changes requested.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
