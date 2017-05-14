From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 21:57:55 +0200
Subject: [Buildroot] [PATCH] package/opencv3: disable explicitly lapack
 support
In-Reply-To: <20170514182655.4945-1-romain.naour@gmail.com>
References: <20170514182655.4945-1-romain.naour@gmail.com>
Message-ID: <20170514215755.65903af0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 20:26:55 +0200, Romain Naour wrote:
> lapack support is enabled by default but the opencv3.mk doesn't handle
> this dependency yet.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c8a/c8a25af38c405594722b44aef34e5e4c549639db
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/opencv3/opencv3.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
