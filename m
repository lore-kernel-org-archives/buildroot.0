From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:40:51 +0100
Subject: [Buildroot] [PATCH 1/1] asterisk: needs threads
In-Reply-To: <20190111173158.31428-1-fontaine.fabrice@gmail.com>
References: <20190111173158.31428-1-fontaine.fabrice@gmail.com>
Message-ID: <20190112184051.2593fa13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 18:31:58 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/85d30a4f94efa868a9155f7dda593ba8079063b5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/asterisk/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
