From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 21:46:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: fix build with NLS
In-Reply-To: <20200223172902.2466208-1-fontaine.fabrice@gmail.com>
References: <20200223172902.2466208-1-fontaine.fabrice@gmail.com>
Message-ID: <20200223214640.308d909d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Feb 2020 18:29:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e0e7ed448df8bdd6cb13a0989d7a6c7dbaa5bc4e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openvmtools/openvmtools.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
