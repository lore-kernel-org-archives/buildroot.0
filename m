From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 16:06:39 +0100
Subject: [Buildroot] [PATCH 2 of 2 v3] git packages: use full revision
 hash
In-Reply-To: <7d2bbe6dc05be8460ba2.1383404248@argentina>
References: <patchbomb.1383404246@argentina>
 <7d2bbe6dc05be8460ba2.1383404248@argentina>
Message-ID: <20131102150639.GB3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2013-11-02 15:57 +0100, Thomas De Schampheleire spake thusly:
> There is no benefit in using the shortened git revision hash. On the
> contrary: the shorter the hash, the higher the risk of having collisions
> with another commit.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>

For those packages I care about:
>  package/rpi-firmware/rpi-firmware.mk             |  2 +-
>  package/rpi-userland/rpi-userland.mk             |  2 +-
>  package/tvheadend/tvheadend.mk                   |  2 +-

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
