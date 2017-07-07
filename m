From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 16:44:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] nginx: bump to version 1.12.0
In-Reply-To: <20170704172008.2564-1-Adamduskett@outlook.com>
References: <20170704172008.2564-1-Adamduskett@outlook.com>
Message-ID: <20170707164421.34a11d7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 13:20:08 -0400, Adam Duskett wrote:
> Also update the patch line numbers to work with 1.12.0
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Moved SOB to below the existing one in first patch (Arnout)

There are build failures, apparently caused by this bump:
http://autobuild.buildroot.net/?reason=nginx-1.12.0. Could you have a
look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
