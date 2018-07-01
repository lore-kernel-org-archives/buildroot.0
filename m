From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:49:31 +0200
Subject: [Buildroot] [PATCH 1/1] python-libconfig: fix build with python2
In-Reply-To: <20180626183945.28667-1-fontaine.fabrice@gmail.com>
References: <20180626183945.28667-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701154931.21406a1b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 20:39:45 +0200, Fabrice Fontaine wrote:
> Since boost 1.67, libboost_python is now named libboost_python27 when
> python2 is enabled
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a1feb4c4b70b3c939ae1127417130ea33a91159b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Determine-boost_python-name-depending-on-current-Pyt.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
