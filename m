From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:42:02 +0200
Subject: [Buildroot] [PATCH 1/1] python-libconfig: fix build with boost
 1.67
In-Reply-To: <20180624175045.2444-1-fontaine.fabrice@gmail.com>
References: <20180624175045.2444-1-fontaine.fabrice@gmail.com>
Message-ID: <20180625214202.4a38186e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jun 2018 19:50:45 +0200, Fabrice Fontaine wrote:
> Since boost 1.67, python3 boost library is boost_python36.so instead of
> boost_python3.so so update first patch
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/6f973f2945727b302409405288ef0b9808c7317b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Determine-boost_python-name-depending-on-current-Pyt.patch | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
