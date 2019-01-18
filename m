From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 Jan 2019 20:32:23 +0100
Subject: [Buildroot] Enable mount SquashFS
In-Reply-To: <CAOqJNTc0j8hKGbugSyOqMKKymn8yB3UBSkvamLe9-cnK572UvA@mail.gmail.com>
References: <CAOqJNTc0j8hKGbugSyOqMKKymn8yB3UBSkvamLe9-cnK572UvA@mail.gmail.com>
Message-ID: <20190118203223.02765998@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ??????,

On Fri, 18 Jan 2019 20:27:41 +0200, ?????? ????? <sergei.sakhno@gmail.com> wrote:

> Good evening everyone. How to enable the ability to mount SquashFS? In the
> menuconfig of busybox downloaded from the busybox site there is an item
> [SquashFS filesystem] in the [Filesystem / Volume identification] section,
> but in the menuconfig of busybox unpacked buildroot it is not.

Busybox CONFIG_FEATURE_VOLUMEID_SQUASHFS depends on VOLUMEID && FEATURE_BLKID_TYPE,
VOLUMEID is already enabled, FEATURE_BLKID_TYPE is Linux System Utilities -->
blkid --> Print Filesystem type

More important is enabled squashfs support in the linux kernel...

Regards,
Peter
