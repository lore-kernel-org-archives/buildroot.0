From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:50:25 +0200
Subject: [Buildroot] [PATCH 1/1] liboping: bump to version 1.10.0
In-Reply-To: <20180520103820.17981-1-fontaine.fabrice@gmail.com>
References: <20180520103820.17981-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520155025.52df71fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 12:38:20 +0200, Fabrice Fontaine wrote:
> - Rework ncurses dependency to use new --with[out]-ncurses option
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liboping/liboping.hash |  5 ++++-
>  package/liboping/liboping.mk   | 10 ++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
