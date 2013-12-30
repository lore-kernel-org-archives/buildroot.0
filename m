From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:07:20 +0100
Subject: [Buildroot] [PATCH] oprofile: disable on xtensa
In-Reply-To: <f0693dd3153f979256d82b2c2f427dd8bb9680df.1388397607.git.baruch@tkos.co.il>
References: <f0693dd3153f979256d82b2c2f427dd8bb9680df.1388397607.git.baruch@tkos.co.il>
Message-ID: <20131231000720.78a0e904@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 30 Dec 2013 12:00:07 +0200, Baruch Siach wrote:
> Missing memory barrier definition. Fixes
> http://autobuild.buildroot.net/results/df7/df797a81111fa15de9337adefca05cbac156d0b2/.
> 
> Also, add nios2 to the dependencies comment while at it.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/oprofile/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
