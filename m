From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:22:12 +0100
Subject: [Buildroot] [PATCH v6 07/28] package/qt5tools: Partially
 convert to qmake infra
In-Reply-To: <20200217212350.29750-8-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-8-anaumann@ultratronik.de>
Message-ID: <20200311222212.6b65861f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:29 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Use generic configure command but for now keep custom build and
> install logic.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5tools/qt5tools.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to master, after dropping the qt5base dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
