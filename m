From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Jan 2015 18:56:40 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
In-Reply-To: <CA+GxxTdWyTkj+HJWr8J0Zf7p3Gm7JgVcd6_msqJF9yvN-WSAMQ@mail.gmail.com>
References: <CA+GxxTdWyTkj+HJWr8J0Zf7p3Gm7JgVcd6_msqJF9yvN-WSAMQ@mail.gmail.com>
Message-ID: <20150121175640.GH4375@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-01-21 11:39 +0100, Ben Ben spake thusly:
> I tried this patch directly from git://git.busybox.net/~ymorin/git/buildroot
> yem/gfx
> 
> I got some header problems with opengl.
> Qt5 looking for sysroot/usr/include/GLES/gl2platform.h and can't find it.
> 
> I tried with mesa3d instead of tegra driver. That's works fine.
> 
> I assume that this header should come with opengl-registery ?

I honestly do not know who should be responsible for providing that one
header. Probably opengl-registry should, indeed.

I'll queue that to the other comments that were made about missing
headers.

Next time, can you please reply to the mail in the series, rather than
start a new thread; it makes it easier to not miss it later on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
