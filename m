From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:04:55 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: fix corelist check
In-Reply-To: <1417629937-27137-1-git-send-email-francois.perrad@gadz.org>
References: <1417629937-27137-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141207230455.536ae4b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  3 Dec 2014 19:05:37 +0100, Francois Perrad wrote:
> module could be removed of the core,
> so check if the module is currently in the core,
> but not if the module was once time included in the core.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/scancpan | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
