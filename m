From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:34:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/bustle: bump to version 0.7.5
In-Reply-To: <20200104184513.2369600-2-fontaine.fabrice@gmail.com>
References: <20200104184513.2369600-1-fontaine.fabrice@gmail.com>
 <20200104184513.2369600-2-fontaine.fabrice@gmail.com>
Message-ID: <20200108093422.00a17fe9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Jan 2020 19:45:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch homepage to https://gitlab.freedesktop.org/bustle/bustle/
> - Switch site to
>   https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bustle/Config.in   | 2 +-
>  package/bustle/bustle.hash | 3 ++-
>  package/bustle/bustle.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
