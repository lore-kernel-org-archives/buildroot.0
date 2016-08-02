From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:35:36 +0200
Subject: [Buildroot] [PATCH] ncurses: install PuTTY terminfo files
In-Reply-To: <1470151527-36242-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1470151527-36242-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160802223536.7995830f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Aug 2016 10:25:27 -0500, Matt Weber wrote:
> From: David Glessner <david.glessner@rockwellcollins.com>
> 
> Signed-off-by: David Glessner <david.glessner@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/ncurses/ncurses.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks. Since this long list of terminfo files
installation was a bit silly, I've sent a follow-up patch on the list
to improve this. Feel free to review/test this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
