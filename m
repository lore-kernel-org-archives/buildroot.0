From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:17:07 +0100
Subject: [Buildroot] [PATCH 2/4 v3] core/pkg-generic: redirect only when
 listing package's installed files
In-Reply-To: <197d62b193e6ada6f1ffe841769d8e200015c04a.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
 <197d62b193e6ada6f1ffe841769d8e200015c04a.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <20171127231707.5b2a7ba5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Oct 2017 17:30:57 +0200, Yann E. MORIN wrote:
> There is no need to redirect again and again for each new file added to
> the list; we can just redirect once and for all.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
