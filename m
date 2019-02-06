From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:28:58 +0100
Subject: [Buildroot] [PATCH] package/libwebsockets: bump to v3.1.0
In-Reply-To: <1546421571-18627-2-git-send-email-qwendu@gmail.com>
References: <1546421571-18627-1-git-send-email-qwendu@gmail.com>
 <1546421571-18627-2-git-send-email-qwendu@gmail.com>
Message-ID: <20190206112858.27b722e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Jan 2019 17:32:51 +0800
qwendu <qwendu@gmail.com> wrote:

> this patch fixed the following error:
> ...
> output/build/libwebsockets-v3.1.0/lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> output/build/libwebsockets-v3.1.0/lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     if (m)
>        ^
> 
> Signed-off-by: qwendu <qwendu@gmail.com>
> ---
>  package/libwebsockets/libuv-uninitialized.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/libwebsockets/libuv-uninitialized.patch

This should be part of the commit bumping libwebsockets.

Also, the patch should have a description and a Signed-off-by line, and
be generated with "git format-patch -N".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
