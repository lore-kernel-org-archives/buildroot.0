From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:36:01 +0100
Subject: [Buildroot] [PATCH v3] util-linux: fix link failures due to
 name clash
In-Reply-To: <1510162681-20797-1-git-send-email-luca@lucaceresoli.net>
References: <1510162681-20797-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20171111233601.0a5704e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 18:38:01 +0100, Luca Ceresoli wrote:
> Several packages have a similar md5.c file, and each has a function
> named byteReverse(). This generates link errors when building
> statically ("multiple definition of `byteReverse'").
> 
> Fix by applying a patch from upstream.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Adam Duskett <aduskett@gmail.com>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
