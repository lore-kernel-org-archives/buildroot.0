From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:26:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/bison: bump to 3.7.1
In-Reply-To: <20200903110112.1752588-1-thomas.claveirole@green-communications.fr>
References: <20200903110112.1752588-1-thomas.claveirole@green-communications.fr>
Message-ID: <20200903222620.2e0dc5ce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Sep 2020 13:01:12 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> Release notes:
> 	https://lists.gnu.org/archive/html/info-gnu/2020-08/msg00000.html
> 
> Tested using utils/test-pkg with toolchain br-arm-full on the
> following reverse-dependencies: bash at dtc host-dtc.  Also tested
> using a custom toolchain and configuration on: conntrack-tools
> iproute2 libnl libpcap libtasn1.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  ...0001-src-make-path-to-m4-relocatable.patch | 70 -------------------
>  package/bison/bison.hash                      |  2 +-
>  package/bison/bison.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 72 deletions(-)
>  delete mode 100644 package/bison/0001-src-make-path-to-m4-relocatable.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
