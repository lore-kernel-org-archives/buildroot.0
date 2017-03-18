From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:34:48 +0100
Subject: [Buildroot] [PATCH v4 1/3] uccp420wlan: new package
In-Reply-To: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <20170318153448.13656871@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 17:13:20 +0530, Abhimanyu V wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> 
> Wifi kernel module and firmware for Imagination explorer RPU
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> ---
>  Changes v1->v2
>   - add hash file
>  Changes v2->v3 (Suggested by Arnout)
>   - remove patch and bump version
>   - add proprietary license file to LICENSE_FILES
>   - Fix help text indentation to below 72 columns
>  Changes v3->v4 (Suggested by Arnout)
>   - use UCCP420WLAN_INSTALL_TARGET_CMDS instead of HOOKS

Applied to master, after taking into account the comments made by
Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
