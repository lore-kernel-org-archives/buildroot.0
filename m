From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:44:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: fix build with python 3.8
In-Reply-To: <20191020165609.6412-1-fontaine.fabrice@gmail.com>
References: <20191020165609.6412-1-fontaine.fabrice@gmail.com>
Message-ID: <20191021214415.0805e34d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 18:56:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/81489f92ceb6287a4d6c52b2bb16a80e8c5c430a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
