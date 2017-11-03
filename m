From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 18:47:11 +0100
Subject: [Buildroot] [PATCH v4 1/1] libsepol: require threads
In-Reply-To: <20171103133306.20198-1-aduskett@gmail.com>
References: <20171103133306.20198-1-aduskett@gmail.com>
Message-ID: <20171103184711.6d2e9213@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 09:33:06 -0400, Adam Duskett wrote:
> libsepol 2.7 now uses pthreads.h
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added thread dependency to semodule-utils (Arnout)

Applied to master after a reference to an autobuilder failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
