From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 14:59:38 +0200
Subject: [Buildroot] [PATCH] package/libgpiod: install to staging
In-Reply-To: <20170729024443.23726-1-andrew.smirnov@gmail.com>
References: <20170729024443.23726-1-andrew.smirnov@gmail.com>
Message-ID: <20170729145938.0035e903@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Jul 2017 19:44:43 -0700, Andrey Smirnov wrote:
> Install to staging to make API headers discoverable by other packages.
> 
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/libgpiod/libgpiod.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
