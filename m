From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:56:48 +0200
Subject: [Buildroot] [PATCHv2] sudo: don't use hardening flags on host
 tools
In-Reply-To: <1411211370-9756-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411211370-9756-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140921195648.57ac5249@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Sep 2014 08:09:30 -0300, Gustavo Zacarias wrote:
> Don't use hardening (SSP_CFLAGS & PIE_CFLAGS) flags on host tools since
> the host compiler may differ wildly from the tests run on the cross
> compiler and they might not work. Fixes:
> http://autobuild.buildroot.net/results/b10/b1091bd04ab988744548b74fb48c64bf291fed2f/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...udo-0002-drop-sspcflags-piecflags-for-host.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/sudo/sudo-0002-drop-sspcflags-piecflags-for-host.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
