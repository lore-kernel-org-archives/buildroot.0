From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:19:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix static build with
 readline
In-Reply-To: <20190925165248.6067-1-fontaine.fabrice@gmail.com>
References: <20190925165248.6067-1-fontaine.fabrice@gmail.com>
Message-ID: <20191007231939.3028d276@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 18:52:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b1a1392636467f8c07504fa6cfb17962764820ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ytree/ytree.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
