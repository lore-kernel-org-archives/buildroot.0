From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:36:44 +0200
Subject: [Buildroot] [PATCH 0 of 6] uclibc: fix handling of
 configuration file
In-Reply-To: <patchbomb.1405338624@localhost>
References: <patchbomb.1405338624@localhost>
Message-ID: <20140715193644.35ed9ab3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 14 Jul 2014 13:50:24 +0200, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (6):
>     pkg-utils: kconfig helpers: add basic usage documentation
>     pkg-utils: kconfig helpers: use single iso double quoting
>     uclibc: replace custom kconfig helpers with those provided by pkg-utils
>     uclibc: rename SETUP_DOT_CONFIG to FIXUP_DOT_CONFIG
>     uclibc: menuconfig: take into account initial settings from config file
>     uclibc: update-config: preserve freshly configured settings

Patches 1 to 3 applied. The others are still in discussion.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
