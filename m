From: Carlo Caione <carlo.caione@gmail.com>
Date: Mon, 18 Mar 2013 09:00:34 +0100
Subject: [Buildroot] Creating JFFS2 rootfs to SPI flash,
 and mounting it from kernel
In-Reply-To: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
References: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
Message-ID: <CAOQ7t2YTJMcZikMzPruOagyjo8s9nYDGBHiXHJz_4PJB8ccNSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 18, 2013 at 7:45 AM, Juha Lumme <juha.lumme@gmail.com> wrote:
> Hi,
>
> Sorry for asking not directly buildroot question, but I thought this forum
> would have many members who knows answer to this one.
> In my project, I'm trying to migrate my file system to spi flash from memory
> card, and I seem to have created filesystem image successfully. I want my
> rootfs to be read-only to avoid corruption issues, and only have application
> files reside on a writable file system.
[cut]

For this point you can take a look to overlayfs:

http://lwn.net/Articles/447650/
http://wiki.openwrt.org/doc/techref/flash.layout

Best,

--
Carlo Caione
