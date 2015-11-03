From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:51:52 +0100
Subject: [Buildroot] [PATCH] imagemagick: use download location as hash
 source
In-Reply-To: <f1f4c7da1fc1a5d9792f673b287b34571e5b121e.1446532981.git.baruch@tkos.co.il>
References: <f1f4c7da1fc1a5d9792f673b287b34571e5b121e.1446532981.git.baruch@tkos.co.il>
Message-ID: <20151103155152.0563d8f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  3 Nov 2015 08:43:01 +0200, Baruch Siach wrote:
> Since commit 12a6c5b12cd1 (imagemagick: use official download site,
> 2015-02-17) we use the official ImageMagic size. Use it also as hash source.
> That's the conversion we use in all other packages when upstream provides
> hashes.
> 
> Cc: Fabio Porcedda <Fabio.Porcedda@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
