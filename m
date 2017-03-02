From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 11:41:34 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: only external toolchain
	option displayed
In-Reply-To: <1488450842-29100-3-git-send-email-ren_guo@c-sky.com>
References: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
 <1488450842-29100-3-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170302114134.404deb94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 18:34:01 +0800, Guo Ren wrote:
> Currently csky architecture isn't support the "internal toolchain
> backend", so we disable it in config.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

This patch should be squashed into PATCH 2/4. If you don't do that and
I commit only PATCH 2/4, then things are broken, because the csky
architecture is added, but we don't prevent users from trying to build
an internal toolchain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
