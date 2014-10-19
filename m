From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:11:57 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/libva-intel-driver: Do not
 depend on xorg
In-Reply-To: <1413654091-2532-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413654091-2532-1-git-send-email-bernd.kuhls@t-online.de>
 <1413654091-2532-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141019121157.277d07df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Oct 2014 19:41:31 +0200, Bernd Kuhls wrote:
> This patch reverts
> http://git.buildroot.net/buildroot/commit/package/libva-intel-driver/Config.in?id=062bacfa67688b2747412a30ddeb996449d1c6df
> 
> By removing the xorg dependency of libpciaccess the libdrm package, and
> therefore also libva-intel-driver, does not depend on xorg any longer.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v3: no changes
> v2: no changes

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
