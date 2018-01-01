From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:15:20 +0100
Subject: [Buildroot] [PATCH 04/10] gst1-plugins-bad: bump to 1.12.4
In-Reply-To: <20180101161722.12637-4-Adamduskett@outlook.com>
References: <20180101161722.12637-1-Adamduskett@outlook.com>
 <20180101161722.12637-4-Adamduskett@outlook.com>
Message-ID: <20180101231520.4565d687@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Jan 2018 11:17:16 -0500, Adam Duskett wrote:
> Remove patch, as it has been added upstream.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  ...upport-building-with-openjpeg-2.3-simpler.patch | 89 ----------------------

Since you're dropping that patch, autoreconf/gettextize of this package
is no longer needed, so I've updated the .mk file accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
