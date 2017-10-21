From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 14:24:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] glibmm: bump required gcc version to
 4.9
In-Reply-To: <20171019214326.5125-1-Adamduskett@outlook.com>
References: <20171019214326.5125-1-Adamduskett@outlook.com>
Message-ID: <20171021142434.4bd5a377@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 17:43:26 -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Fixed comment in Config.in (Thomas)
>   - Updated dependencies on packages that depend on glibmm. (Thomas)

You forgot the reverse dependencies of the reverse dependencies, i.e
pulseview. I've fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
