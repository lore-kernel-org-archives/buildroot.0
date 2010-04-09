From: Purnendu Kapadia <purnendukapadia@gmail.com>
Date: Fri, 9 Apr 2010 10:17:37 +0100
Subject: [Buildroot] problems with [PATCH] [RFC] Add mx25_3stack support
Message-ID: <v2j11b870eb1004090217p6a514f22j4950feb86f16c38c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I am trying the patch to get buildroot daily snapshot based system working.

As I could not apply the patch, I manually applied the changes to get
kernel,
uboot, filesystem built using buildroot. Please suggest a command to apply
the
patch. When I apply the patch I get following message :

cat imx25_support_buildroot.patch | patch -p1
patch: **** Only garbage was found in the patch input.

Now when I boot the iMX25 3stack board via NFS, I get following :

VFS: Mounted root (nfs filesystem).
Freeing init memory: 112K
init_post() : after free_initmem()
init_post() : after free_initmem()
init_post() : after sys_open(/dev/console)
init_post() : after run_init_process(ramdisk_execute_command)
init_post() : after run_init_process(execute_command)

It seems that the init from busybox is not starting.

Any suggestions are very welcome.

Purnendu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100409/bfc2ed3a/attachment.htm>
