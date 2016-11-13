From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:23:35 +0100
Subject: [Buildroot] [PATCH] jasper: disable -pedantic-errors
In-Reply-To: <72941ffb162f0bdf077c0dc15faaff86f4abfa88.1478978996.git.baruch@tkos.co.il>
References: <72941ffb162f0bdf077c0dc15faaff86f4abfa88.1478978996.git.baruch@tkos.co.il>
Message-ID: <20161113122335.70d33001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 21:29:56 +0200, Baruch Siach wrote:
> The -pedantic-errors gcc option turns -pedantic warnings into errors. This
> mostly affects older gcc versions that default to the ISO90 C standard. Use
> the --disable-strict configure option to remove -pedantic-errors.
> 
> Fixes:
> http://autobuild.buildroot.net/results/191/191f80779df1a9e6f832106e6c4bdf601e2a9893/
> http://autobuild.buildroot.net/results/1fe/1febccc7215814490fa3c776b34bc367363afe39/
> http://autobuild.buildroot.net/results/a6f/a6f9bfec3406fc21b130f1669e3534651b9c9596/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/jasper/jasper.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
