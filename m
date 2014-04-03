From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 19:03:18 +0200
Subject: [Buildroot] [PATCH 5/6] package/x11-video-drivers: do not
 select, but depends on mesa3d
In-Reply-To: <qt6u0bxtl5.ln2@ID-313208.user.individual.net>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <887ad694204dc2032ade7bdacb8e9d9aa48205ac.1396302677.git.yann.morin.1998@free.fr>
 <qt6u0bxtl5.ln2@ID-313208.user.individual.net>
Message-ID: <20140403170318.GB3202@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-02 22:01 +0200, Bernd Kuhls spake thusly:
> Hi,
> 
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:887ad694204dc2032ade7bdacb8e9d9aa48205ac.1396302677.git.yann.morin.199
> 8 at free.fr: 
> 
> > a/package/x11r7/xdriver_xf86-video-intel/Config.in +++
> > b/package/x11r7/xdriver_xf86-video-intel/Config.in @@ -1,5 +1,7 @@
> 
> [...]
> 
> > +comment "xf86-video-intel needs mesa3d"
> > +     depends on BR2_PACKAGE_MESA3D
> 
> "depends on !BR2_PACKAGE_MESA3D"

Good catch! Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
