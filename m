From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2020 16:34:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/toolchain-external: ensure
 ARCH_LIB_DIR exist
In-Reply-To: <CAAXf6LV-f9o_9oY4+Me4qHRJeQhCWA75H1GOEYMoRPu5j4m-Jg@mail.gmail.com>
References: <1577937441-18703-1-git-send-email-han_mao@c-sky.com>
 <CAAXf6LUVA4QkSmz8OaSOyqzKaw--eD5r0zAD+zONfyGROv1MZw@mail.gmail.com>
 <20200113033451.GA15150@vmh-VirtualBox>
 <CAAXf6LWZZKCW=g=ReXz00hLJSiBw6sJfsmSxu0=Q_J4FVda32g@mail.gmail.com>
 <20200117023547.GA12999@vmh-VirtualBox>
 <CAAXf6LV-f9o_9oY4+Me4qHRJeQhCWA75H1GOEYMoRPu5j4m-Jg@mail.gmail.com>
Message-ID: <20200126153443.GP32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mao, All,

On 2020-01-24 16:00 +0100, Thomas De Schampheleire spake thusly:
> El vie., 17 ene. 2020 a las 3:35, Mao Han (<han_mao@c-sky.com>) escribi?:
[--SNIP--]
> > There is another patch in the same thread:
> > [PATCH 2/2] toolchain: Get ld.so name if available
> > http://buildroot-busybox.2317881.n4.nabble.com/PATCH-1-2-package-toolchain-external-ensure-ARCH-LIB-DIR-exist-td243604.html#a244193
> > Tried to get the corresponding ld.so name with certain configuration.
> Thanks. Using this patch '[PATCH 2/2] toolchain: Get ld.so name if
> available' I actually can compile correctly.
> So, PATCH 1/2 is not actually needed.
> 
> Do you agree that only PATCH 2/2 is required?
> If so I will perform a more thorough review of that patch.

Given the feedback from Thomas, and the coments I provided on the second
patch, I've marked the two patches as Changes Requested on patchwork.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
