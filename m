From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:21:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/ifplugd: add patch to fix musl
 build error
In-Reply-To: <1438448071-26514-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438448071-26514-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150803112152.6438a822@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat,  1 Aug 2015 18:54:31 +0200, J?rg Krause wrote:
> The musl C library does not define type names such as `__uint32_t`. Instead we
> use the integer types declared in the ISO C standard header file <stdint.h>.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/ifplugd/0004-musl-fix-types.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/ifplugd/0004-musl-fix-types.patch

Applied. Please submit the patch upstream, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
