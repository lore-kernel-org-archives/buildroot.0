From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:36:42 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: remove more busybox applet links
In-Reply-To: <ab0038f8843309692e0f0a502b3223fe2525fa19.1437582556.git.baruch@tkos.co.il>
References: <ab0038f8843309692e0f0a502b3223fe2525fa19.1437582556.git.baruch@tkos.co.il>
Message-ID: <20150722223642.098dd179@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 22 Jul 2015 19:29:16 +0300, Baruch Siach wrote:
> Following commit aa02829240b2 (e2fsprogs: remove busybox tune2fs when
> installing full version, 2015-07-08), remove the rest of Busybox e2fsprogs
> applet links. All of them are installed in different locations than upstream
> e2fsprogs.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
