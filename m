From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 01:13:10 -0300
Subject: [Buildroot] [PATCH 14/36] toolchain/toolchain.mk: fix code style
References: <20180331082152.62797621@windsurf>
Message-ID: <5ac05c56bd3e1_7cbc3fbe8f3f00d821de@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Mar 31, 2018 at 03:21 AM, Thomas Petazzoni wrote:

>>  define COPY_GCONV_LIBS
> 
> Perhaps the name of this variable should also be name-spaced:
> TOOLCHAIN_GLIBC_COPY_GCONV_LIBS or something like that.

Indeed. Other packages already use namespace for hooks, i.e.:
PYTHON3_CREATE_PYC_FILES
SKELETON_INIT_COMMON_SET_HOSTNAME
I will do.


Regards,
Ricardo
