From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 08:34:06 +0100
Subject: [Buildroot] [PATCH 6/8] package/rpm: security bump to 4.14.2.1
In-Reply-To: <20190328202854.26337-6-fontaine.fabrice@gmail.com>
References: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
 <20190328202854.26337-6-fontaine.fabrice@gmail.com>
Message-ID: <20190329083406.60b6c05f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 21:28:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first and second patches (already in version)
> - Remove third and fourth patches (not needed since:
>   https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c)
> - Add hash for license file
> - Drop autoreconf (as configure.ac is not patched anymore)
> - Use new --with-crypto option
> - Restrict symlink following on installation (CVE-2017-7500,
>   CVE-2017-7501)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Can this be applied as PATCH 1/8 ? Indeed, we will want this security
bump in the LTS release, but not all the patches before it.

Ideally, this patch should be first in the series.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
