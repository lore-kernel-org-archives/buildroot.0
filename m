From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:10:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: upstream fixes for
 2.31.1
In-Reply-To: <20190315214405.3909-1-nolange79@gmail.com>
References: <20190315214405.3909-1-nolange79@gmail.com>
Message-ID: <20190315231038.79a45eb8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Fri, 15 Mar 2019 22:44:05 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> combining musl and binutils 2.31.1 will
> produce static applications that crash
> immediately.
> Picked 2 upstream commits to remedy this.
> 
> see https://sourceware.org/bugzilla/show_bug.cgi?id=23428
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Thanks, but we need you to add your Signed-off-by inside the patches, right after the:

(cherry picked from commit ...)

line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
