From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:03:28 +0100
Subject: [Buildroot] [PATCHv2] [ABO-fix] package/systemd-bootchart: bump
 version
In-Reply-To: <1483203279-14711-1-git-send-email-yann.morin.1998@free.fr>
References: <1483203279-14711-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170101090328.0edb771f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 31 Dec 2016 17:54:39 +0100, Yann E. MORIN wrote:
> Get rid of our patch, applied upstream. Which means we no longer need to
> run intltoolize. So drop the dependency on host-intltool
> 
> Fixes:
>     http://autobuild.buildroot.net/results/696/696254009f830134ef9398369ca2cbb257b33f52/
>     http://autobuild.buildroot.org/results/aca/aca210de7d3f2eda54e5630206e9ff80d72d85c5/
>     http://autobuild.buildroot.org/results/e5d/e5df8d11bfce4ba7a4c5c760b4784c31c506d8d4/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - drop autoreconf, don't comment it  (Maxime)
>   - drop dependency on host-intltool
>   - update comment about not using the github helper
> ---
>  ...onfigure-add-option-to-not-build-manpages.patch | 59 ----------------------
>  package/systemd-bootchart/systemd-bootchart.hash   |  2 +-
>  package/systemd-bootchart/systemd-bootchart.mk     | 16 ++----
>  3 files changed, 6 insertions(+), 71 deletions(-)
>  delete mode 100644 package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
