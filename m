From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:24:19 +0100
Subject: [Buildroot] [PATCH] fio: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1454858721-3670-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454858721-3670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160207222419.2b0c54b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  7 Feb 2016 12:25:21 -0300, Gustavo Zacarias wrote:
> It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
> http://autobuild.buildroot.net/results/692/692fe7999efb63a2bffee02f84b9f636afcfe5f4/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/fio/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks. This patch had patchwork ID #580000 :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
