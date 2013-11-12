From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Nov 2013 18:42:47 +0100
Subject: [Buildroot] [PATCH 2/2] busybox: ensure $(BUSYBOX_BUILD_CONFIG)
 is writable
In-Reply-To: <CANxTyt5qCLXrOCnp5hrxwTkzfoH3DORs6uoDiBr5Jr1w3+0R2A@mail.gmail.com>
References: <cover.1384191560.git.yann.morin.1998@free.fr>
 <0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e.1384191560.git.yann.morin.1998@free.fr>
 <CANxTyt5qCLXrOCnp5hrxwTkzfoH3DORs6uoDiBr5Jr1w3+0R2A@mail.gmail.com>
Message-ID: <20131112174247.GA3434@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2013-11-11 15:22 -0500, Danomi Manchego spake thusly:
> On Mon, Nov 11, 2013 at 12:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: Nathan Lynch <ntl@pobox.com>
> >
> > If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
> > source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.
> 
> These share the same issue:
> 
> - linux.mk:  $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> - uclibc,mk:  $(UCLIBC_DIR)/.oldconfig

Indeed, I'll add them to the series. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
