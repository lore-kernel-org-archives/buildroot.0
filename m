From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:35:38 +0100
Subject: [Buildroot] [PATCH 2/3] package/openocd: disable aice
 programmer on non-MMU architecture
In-Reply-To: <1420233568-10133-2-git-send-email-s.martin49@gmail.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
 <1420233568-10133-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150103213538.7e86f444@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri,  2 Jan 2015 22:19:27 +0100, Samuel Martin wrote:
> aice sources use fork function, which is only available on architecture
> with MMU.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/openocd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
