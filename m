From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 13:53:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/openpgm: Rework defines to fix
 build with musl libc
In-Reply-To: <1463853064-1337-1-git-send-email-bernd.kuhls@t-online.de>
References: <1463853064-1337-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160523135313.0a80849c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 May 2016 19:51:04 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/420/420367cc4640c893f48336d71fa04eaeff55c8e6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ework-defines-to-fix-build-with-musl-libc.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/openpgm/0003-Rework-defines-to-fix-build-with-musl-libc.patch

Your commit title and description says "Rework defines", but actually
you're reworking "Headers includes", so I've fixed that up and applied
to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
