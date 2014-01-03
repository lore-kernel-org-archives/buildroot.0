From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 3 Jan 2014 17:11:06 +0100
Subject: [Buildroot] [PATCH v5 0/5] udev is now provided by systemd or
 eudev
In-Reply-To: <CAHXCMM+D0-FZKuj+_XXj5E3EfA+pud06t02LVE3ifQw+M_kGkA@mail.gmail.com>
References: <1388753057-13485-1-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMM+D0-FZKuj+_XXj5E3EfA+pud06t02LVE3ifQw+M_kGkA@mail.gmail.com>
Message-ID: <20140103161104.GA3940@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Thanks for the feedback!

On Fri, Jan 03, 2014 at 02:49:21PM +0100, Samuel Martin wrote:
>    The problems were:
>    - Some packages still use BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV after
>    applying the patchs:
>    A  $ git grep -l BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>    A  docs/manual/adding-packages-directory.txt
>    A  package/libmbim/Config.in
>    A  package/modem-manager/Config.in
>    A  package/network-manager/Config.in
modem-manager and libmbim are recent additions that fell off my radar...
I'll fix this and update my test configs.

>    - What does BR2_PACKAGE_UDEV_ALL_EXTRAS become?
This symbol has been removed after this discussion:
http://lists.busybox.net/pipermail/buildroot/2013-September/078503.html.

Best regards,
ELB
