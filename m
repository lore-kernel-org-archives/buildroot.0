From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:01:16 +0200
Subject: [Buildroot] [PATCH 1/1] setools: change sepol library directory
In-Reply-To: <20171019214603.5402-1-Adamduskett@outlook.com>
References: <20171019214603.5402-1-Adamduskett@outlook.com>
Message-ID: <20171021100116.1765e88d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 17:46:03 -0400, Adam Duskett wrote:
> setools currently points the libsepol library directory to
> $(STAGING_DIR)/lib/ when it should be $(STAGING_DIR)/usr/lib
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/setools/setools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
