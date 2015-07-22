From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:03:39 +0200
Subject: [Buildroot] [PATCH] openipmi: don't search host library path
In-Reply-To: <1a12fb9982cbe53f904c435e4fe565927e54f353.1437538857.git.baruch@tkos.co.il>
References: <1a12fb9982cbe53f904c435e4fe565927e54f353.1437538857.git.baruch@tkos.co.il>
Message-ID: <20150722110339.0aeb2ef1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 22 Jul 2015 07:20:57 +0300, Baruch Siach wrote:
> Add a patch removing search of host library path.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bb9/bb9a5d4f2058765a3630170a11ee087c9c289c3d/
> http://autobuild.buildroot.net/results/0b3/0b37f7648bed99bcb1b5bf727171ccc83283d01e/
> http://autobuild.buildroot.net/results/5f7/5f7e6b3279d0e78e3298cdfe7db595e5043ff685/
> 
> and many more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> As the OpenIPMI website is down at the moment due to sourceforge
> infrastructure issues I haven't sent the patch upstream yet.
> ---
>  .../0001-Avoid-searching-host-library-path.patch   | 52 ++++++++++++++++++++++
>  package/openipmi/openipmi.mk                       |  2 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 package/openipmi/0001-Avoid-searching-host-library-path.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
