From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:46:54 +0200
Subject: [Buildroot] [PATCH 1/1] botan: bump to version 2.8.0
In-Reply-To: <20181010050325.2049-1-fontaine.fabrice@gmail.com>
References: <20181010050325.2049-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010104654.6b48afc0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 07:03:25 +0200, Fabrice Fontaine wrote:
> Fix build on i586, https://patchwork.ozlabs.org/patch/970313 has been
> merged upstream
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aaa2ea8c3fb5fe954c0af0061f83ad70e0a862f9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.hash | 2 +-
>  package/botan/botan.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
