From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:56:46 +0200
Subject: [Buildroot] [PATCH] Makefile: do not purge locale-archive from
 target
In-Reply-To: <1403083410-4278-1-git-send-email-neumann@teufel.de>
References: <1403083410-4278-1-git-send-email-neumann@teufel.de>
Message-ID: <20140715225646.6e2dcc8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Wed, 18 Jun 2014 11:23:30 +0200, Sven Neumann wrote:
> The rules to purge unwanted locales from the target also removed
> the locale-archive file from /usr/lib/locale which contains the
> locale definitions explicitly generated for the target.
> 
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
