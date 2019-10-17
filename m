From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Oct 2019 19:55:51 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/meson: bump to version
 0.52.0"
In-Reply-To: <CADvTj4pZRKj32Y-qxyoWJ3cBk9bH_JzPt9cR6CNHuRkHNaUeaA@mail.gmail.com>
References: <20191017172048.12806-1-fontaine.fabrice@gmail.com>
 <CADvTj4pZRKj32Y-qxyoWJ3cBk9bH_JzPt9cR6CNHuRkHNaUeaA@mail.gmail.com>
Message-ID: <20191017175551.GH14656@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, Fabrice, All,

On 2019-10-17 19:34 +0200, James Hilliard spake thusly:
> On Thu, Oct 17, 2019 at 7:20 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> > This reverts commit 4c27fee9f7034bee542cb8d192632e6eb13d6c37.
> > Latest version of meson needs python with lzma support enabled, see
> > https://github.com/mesonbuild/meson/issues/6012.
> It was suggested that we could add host-xz to our
> HOST_PYTHON3_DEPENDENCIES here:
> https://patchwork.ozlabs.org/patch/1176087/#2281476

Alternatively, Thomas was proposing  simple patch to fix the issue:
    http://code.bulix.org/gdxcu4-914360

Thomas, will you send it officially, or do you want me to adpot it?
Ditto for upstreaming?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
