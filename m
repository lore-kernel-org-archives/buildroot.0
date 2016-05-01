From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:55:26 +0200
Subject: [Buildroot] [PATCH v2] opencv: fix compile issues
In-Reply-To: <20160405111617.GA23318@waldemar-brodkorb.de>
References: <20160405111617.GA23318@waldemar-brodkorb.de>
Message-ID: <20160501235526.24b2435c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Apr 2016 13:16:17 +0200, Waldemar Brodkorb wrote:
> The first patch from Debian fixes following autobuild failure:
> http://autobuild.buildroot.net/results/eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
> 
> Tested with ARM build without a regression.
> 
> The second patch fixes musl arm autobuild failure:
> http://autobuild.buildroot.net/results/6a397de789c809984b851a304078e26b2ac58974/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   * Add Signed-Off-By and description to Debian patch, suggested by Arnout
>   * added backport fix for ARM musl from git master
> ---
>  package/opencv/0002-atomic.patch         | 229 +++++++++++++++++++++++++++++++
>  package/opencv/0003-avoid-sysctl_h.patch |  31 +++++
>  2 files changed, 260 insertions(+)
>  create mode 100644 package/opencv/0002-atomic.patch
>  create mode 100644 package/opencv/0003-avoid-sysctl_h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
