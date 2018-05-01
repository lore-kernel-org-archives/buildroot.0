From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 15:20:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcurl: fix building against
 libressl
In-Reply-To: <20180501124313.31033-1-aduskett@gmail.com>
References: <20180501124313.31033-1-aduskett@gmail.com>
Message-ID: <20180501152003.49af2128@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 08:43:13 -0400, Adam Duskett wrote:
> LibreSSL 2.7.x breaks libcurl 7.59.0 with the error:
> error: static declaration of ?OpenSSL_version_num? follows non-static
> declaration
> 
> This failure has since been fixed upstream with commit:
> https://github.com/curl/curl/commit/7c90c93c0b061da81f69fabdd57125b2783c15fb
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Formatted patch with git cherry-pick -x (Thomas and Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
