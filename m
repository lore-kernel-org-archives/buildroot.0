From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:19:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pymodbus: switch back to
 github
In-Reply-To: <20191022184116.5981-1-fontaine.fabrice@gmail.com>
References: <20191022184116.5981-1-fontaine.fabrice@gmail.com>
Message-ID: <20191022221941.0283ebf1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 20:41:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pypi tarball does not contain the license file so switch back to github
> until upstream fixes this issue, see
> https://github.com/riptideio/pymodbus/issues/401
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6701b1e038b58fcd49240ceb7f972885e2e037aa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 7 +++----
>  package/python-pymodbus/python-pymodbus.mk   | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
