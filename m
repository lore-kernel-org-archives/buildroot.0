From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Oct 2018 00:43:02 +0200
Subject: [Buildroot] [PATCH v1] qt5x11extras: fix license info for 5.11.2
In-Reply-To: <20181019175455.26811-1-ps.report@gmx.net>
References: <20181019175455.26811-1-ps.report@gmx.net>
Message-ID: <20181022004302.6254e18e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Oct 2018 19:54:55 +0200, Peter Seiderer wrote:
> With the latest version update the legacy version files
> LICENSE.GPLv2 LICENSE.GPLv3 and LICENSE.LGPLv3 were removed,
> use the new ones LICENSE.GPL2 LICENSE.GPL3 and LICENSE.LGPL3
> instead.
> 
> Fixes [1]:
> 
>   qt5x11extras 5.11.2 Collecting legal info
>   sha256sum: .../build/qt5x11extras-5.11.2/LICENSE.GPLv2: No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/238bb74f23d7a11516eac088da3188d463abac5a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5x11extras/qt5x11extras.hash | 7 +++++--
>  package/qt5/qt5x11extras/qt5x11extras.mk   | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

I've applied, but after doing additional changes:

 - Switching to using per-version hash files

 - Adding the missing hashes for the 5.6.3 license files

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
