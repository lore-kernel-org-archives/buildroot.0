From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:34:31 +0200
Subject: [Buildroot] [PATCH v2] package/python-pycairo: new package
In-Reply-To: <20190621201955.40745-1-matthew.weber@rockwellcollins.com>
References: <20190621201955.40745-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190621223431.7d6f7bfa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Jun 2019 15:19:55 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> A Python module providing bindings for the cairo graphics library.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v1 -> v2
> [Thomas P
>  - Fixed typo in Config.in "select on" -> "select"
>  - Added mk dependency on cairo and removed comment about it just
>    being a runtime dependency
>  - Updated LGPL to be 2.1 and or'd with MPL
>  - Added license files for LGPL and MPL
>  - Added new license file hashes
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-pycairo/Config.in           |  7 +++++++
>  package/python-pycairo/python-pycairo.hash |  7 +++++++
>  package/python-pycairo/python-pycairo.mk   | 15 +++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-pycairo/Config.in
>  create mode 100644 package/python-pycairo/python-pycairo.hash
>  create mode 100644 package/python-pycairo/python-pycairo.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
