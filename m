From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:48:13 +0100
Subject: [Buildroot] [PATCH] gdk-pixbuf: security bump to version 2.32.3
In-Reply-To: <1450135196-23993-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450135196-23993-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215214813.5618480e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Dec 2015 20:19:56 -0300, Gustavo Zacarias wrote:
> Fixes:
> * Fix two crashes in the bmp loader (#747605, #758991)
> * ico: integer overflow fixes
> 
> No CVEs assigned yet.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
>  package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
