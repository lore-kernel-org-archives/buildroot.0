From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 23:02:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/spdlog: disable example
In-Reply-To: <20200114175913.1589808-1-fontaine.fabrice@gmail.com>
References: <20200114175913.1589808-1-fontaine.fabrice@gmail.com>
Message-ID: <20200114230247.1575ed17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jan 2020 18:59:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> SPDLOG_BUILD_EXAMPLES has been renamed SPDLOG_BUILD_EXAMPLE since
> version 1.4.0 and
> https://github.com/gabime/spdlog/commit/bb0f3839c1e52948f2ecb66e4e0aa79740a30205
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/spdlog/spdlog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
