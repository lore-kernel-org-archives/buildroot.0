From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 14:05:21 +0100
Subject: [Buildroot] [PATCH 1/2] wayland: bump to version 1.13.0
In-Reply-To: <20170304234705.2d0ee879@free-electrons.com>
References: <20170302152630.28568-1-gustavo@zacarias.com.ar>
 <20170304234705.2d0ee879@free-electrons.com>
Message-ID: <20170305130521.GB3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gustavo, All,

On 2017-03-04 23:47 +0100, Thomas Petazzoni spake thusly:
> On Thu,  2 Mar 2017 12:26:29 -0300, Gustavo Zacarias wrote:
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  package/wayland/wayland.hash | 4 ++--
> >  package/wayland/wayland.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> This causes some build failures:
> 
>   http://autobuild.buildroot.net/results/291/291e0f1ea18004190ae5acd9bec147cacc3e4bda/build-end.log
> 
> The problem is that it tries to build one test written in C++, while
> wayland doesn't depend on C++ support. I guess the build of tests
> should be disabled.

Patches posted:
    https://patchwork.ozlabs.org/patch/735422/
    https://patchwork.ozlabs.org/patch/735421/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
