From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:42:07 +0200
Subject: [Buildroot] [PATCH 1/2] openipmi: fix missing -lrt for
 clock_gettime
In-Reply-To: <b1e61f493d8b5e488f8e2dcdd9f2c43baf70959d.1437650315.git.baruch@tkos.co.il>
References: <b1e61f493d8b5e488f8e2dcdd9f2c43baf70959d.1437650315.git.baruch@tkos.co.il>
Message-ID: <20150723224207.00dd3a33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 23 Jul 2015 14:18:34 +0300, Baruch Siach wrote:
> Add a patch to detect when -lrt is needed. This fixes build with glibc < 2.17.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2b0/2b0eb7149c7bdd8ebd72c1070aeefb210379a889/
> http://autobuild.buildroot.net/results/49f/49fbd7e2dc72279c5b54d0f59a055e3e5e73f648/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...c-detect-lrt-requirement-for-clock_gettim.patch | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
