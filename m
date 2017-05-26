From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 16:56:38 +0200
Subject: [Buildroot] [PATCH next 1/2] mesa3d: bump version to 17.1.1
References: <20170526131607.34436-1-Vincent.Riera@imgtec.com>
Message-ID: <6aslvdxn3j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 26 May 2017 14:16:06 +0100 schrieb Vicente Olivert Riera:

> Patch 0005 tweaked to apply on this release.
> 
> Patch 0006 already included in this release:
>   https://cgit.freedesktop.org/mesa/mesa/commit/?
id=e75001811e3b66986b4ede165a0fdde703d4f05b
> 
> zlib is now a mandatory dependency.

Hi,

the Vulkan Intel driver does not depend on the i965 dri driver anymore:

https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?
h=17.1&id=9aebdb5d082ec640fe8a14704201952bddb50a88

So please add this change as well: https://github.com/bkuhls/buildroot/
commit/8e880784e52728e6f6bc066d8a2dae5408b593d5#diff-30324b744ed4e90dac736d90b54ad0dfL156

Did you send your patches by using the get-developers script? I am asking 
because I did not receive your patches in CC as maintainer for mesa3d.

Regards, Bernd
