From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:57:48 +0100
Subject: [Buildroot] [PATCH] uclibc: add a upstream patch to fix vlc
 runtime issues
In-Reply-To: <20160205063349.GA22649@waldemar-brodkorb.de>
References: <20160205063349.GA22649@waldemar-brodkorb.de>
Message-ID: <20160205215748.2bf799b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 5 Feb 2016 07:33:49 +0100, Waldemar Brodkorb wrote:
> IDN related declaration without implementation is a bad idea.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...e-netdb.h-Do-not-define-IDN-related-flags.patch |   54 ++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/uclibc/0001-include-netdb.h-Do-not-define-IDN-related-flags.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
