From: Fredy Yanardi <fyanardi@gmail.com>
Date: Thu, 17 Jan 2008 11:44:36 +0800
Subject: [Buildroot] Kernel CONFIG_ROOT_NFS is ignored?
Message-ID: <1ec1a3270801161944v6753f3cp1c56ff3f497b05b8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I know this sounds rather stupid, but I've spent few hours figuring
out this thing. I'm using Buildroot to get a kernel + root filesytem
for at91rm9261-ek board. So far I've successfully build everything
(getting kernel image and root filesystem image)

The only problem that I can't boot from NFS using this kernel (no root
nfs support in kernel). I've tried to modify CONFIG_ROOT_NFS to 'y' in
target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config
but somehow seems that it is always been ignored when buildroot
applying the configuration. When I try to re-run make in buildroot
directory, it turns out that ROOT_NFS is always set back to 'n'. (I've
tried to modify other config options from the config file, and the
change is not ignored).

I'm using buildroot snapshot 16 January 2008. I've also set
CONFIG_IP_PNP to 'y', maybe I missed something else?

Thanks for all your help,

Fredy
