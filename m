From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:47:41 +0200
Subject: [Buildroot] [PATCH] xl2tp: Drop OpenSSL dependency
In-Reply-To: <CADmjQguHchEn_Tg7yC+4UjD8mW79ySOn-Ko7V=wicmsmPtz_ZQ@mail.gmail.com>
References: <CADmjQguHchEn_Tg7yC+4UjD8mW79ySOn-Ko7V=wicmsmPtz_ZQ@mail.gmail.com>
Message-ID: <20170902224741.5fa7c041@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Sep 2017 19:33:13 +0300, Alexander Mukhin wrote:
> xl2tp does not depend on OpenSSL since version 1.3.4.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  package/xl2tp/Config.in | 1 -
>  package/xl2tp/xl2tp.mk  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
