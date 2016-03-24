From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:31:11 +0100
Subject: [Buildroot] [PATCH v2] qt5base: disable c++ standard compiler
 flags for the host build
In-Reply-To: <1458827395-24205-1-git-send-email-yegorslists@googlemail.com>
References: <1458827395-24205-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160324223111.05ea1b00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 14:49:55 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Apply upstream patch, that disables c++ standard compiler flags
> unconditionally for host builds.
> 
> Fixes:
> http://autobuild.buildroot.net/results/895/8958cfb71efdd3ce32b2145237e865ca8a6a6a7f/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> Changes:
> 	v2: rewrite patch subject text (Julien Corjon)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
