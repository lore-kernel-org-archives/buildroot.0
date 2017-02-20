From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:36:20 +0100
Subject: [Buildroot] [PATCH] uclibc: define struct ucontext for or1k
In-Reply-To: <20170217214849.GA29072@waldemar-brodkorb.de>
References: <20170217214849.GA29072@waldemar-brodkorb.de>
Message-ID: <20170220213620.7b0b3d7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 22:48:49 +0100, Waldemar Brodkorb wrote:
> Add missing define for struct ucontext for OpenRISC.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d8715a2b3783d877edf91bb14a80d36eac749b36
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...3-or1k-add-missing-definition-of-ucontext.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/uclibc/0003-or1k-add-missing-definition-of-ucontext.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
