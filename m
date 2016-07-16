From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 22:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/ti-sgx-um: fix syntax error in
 Config.in
In-Reply-To: <1468696161-7287-1-git-send-email-Aduskett@gmail.com>
References: <1468696161-7287-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160716223855.3d25c151@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 15:09:21 -0400, Adam Duskett wrote:
> This fixes a small syntax error in Config.in that stops buildroot from
> parsing the Config file.  The error is as follows:
> 
> package/ti-sgx-um/Config.in:6: syntax error
> package/ti-sgx-um/Config.in:5: invalid option
> package/ti-sgx-um/Config.in:6: unknown option "BR2_TOOLCHAIN_HAS_THREADS"
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks, but this has already been fixed in master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
