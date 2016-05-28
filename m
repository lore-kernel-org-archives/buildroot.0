From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:32:02 +0200
Subject: [Buildroot] [PATCH v2 1/4] uclibc: generate valid config for
 BFLT/FDPIC
In-Reply-To: <20160513070108.GA5748@waldemar-brodkorb.de>
References: <20160513070108.GA5748@waldemar-brodkorb.de>
Message-ID: <20160528153202.3ae66624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 09:01:08 +0200, Waldemar Brodkorb wrote:
> Generate a valid configuration for architectures with
> FDPIC and BFLT support.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - no changes
> ---
>  package/uclibc/uclibc.mk | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
