From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 15:47:59 +0200
Subject: [Buildroot] [PATCH v7 8/9] support/scripts: relocate-sdk.sh now
 creates sdk-location in share/buildroot
In-Reply-To: <1499273594-12106-9-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-9-git-send-email-wg@grandegger.com>
Message-ID: <20170720154759.31ebb2c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 18:53:13 +0200, Wolfgang Grandegger wrote:
> This is because $(HOST_DIR)/usr is gone.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/misc/relocate-sdk.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
