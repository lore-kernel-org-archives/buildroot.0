From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build
 with pcap
In-Reply-To: <20190417223634.6878-1-fontaine.fabrice@gmail.com>
References: <20190417223634.6878-1-fontaine.fabrice@gmail.com>
Message-ID: <20190418112653.2458c37f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 00:36:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to find pcap dependencies
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/277a24ad543a8f54cc8afde4f359f5d77b42eb7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0003-FindPCAP.cmake-fix-static-build.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
