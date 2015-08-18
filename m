From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 22:10:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.7.0
In-Reply-To: <1439323928-16566-1-git-send-email-joerg.krause@embedded.rocks>
References: <1439323928-16566-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150818221035.09449415@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 11 Aug 2015 22:12:08 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libuv/libuv.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks. Can you report upstream the problem that is
worked around by the LIBUV_FIXUP_AUTOGEN hook so that it get fixed in a
future release?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
