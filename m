From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 15:38:38 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/rubix: bump to version
 1.0.6
In-Reply-To: <20190524144614.1586-1-fontaine.fabrice@gmail.com>
References: <20190524144614.1586-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526153838.1d1a0894@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 May 2019 16:46:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to http://sed.free.fr/rubix
> - Add hash for license file
> - Switch to generic-package (configure script has been removed)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rubix/Config.in  |  2 +-
>  package/rubix/rubix.hash |  3 ++-
>  package/rubix/rubix.mk   | 15 ++++++++++++---
>  3 files changed, 15 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
