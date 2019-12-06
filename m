From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:35:01 +0100
Subject: [Buildroot] [PATCH 4/4] package/python-daphne: bump to version
 2.4.0
In-Reply-To: <20191205221515.3121562-4-aduskett@gmail.com>
References: <20191205221515.3121562-1-aduskett@gmail.com>
 <20191205221515.3121562-4-aduskett@gmail.com>
Message-ID: <20191206233501.364b40c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 14:15:15 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Update hash for PKG-INFO due to a version bump in the file.
>   - select BR2_PACKAGE_PYTHON_TWISTED_TLS as a runtime dependency.
>   - Update 0001-remove-pytest-runner-requirement.patch to work with the new
>     version.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  .../0001-remove-pytest-runner-requirement.patch             | 2 +-
>  package/python-daphne/Config.in                             | 1 +
>  package/python-daphne/python-daphne.hash                    | 6 +++---
>  package/python-daphne/python-daphne.mk                      | 4 ++--
>  4 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
