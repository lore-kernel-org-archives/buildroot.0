From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:32:21 +0100
Subject: [Buildroot] [PATCH v5 1/2] ipset: install libraries
In-Reply-To: <1487147932-17148-1-git-send-email-apalos@gmail.com>
References: <1487147932-17148-1-git-send-email-apalos@gmail.com>
Message-ID: <20170220223221.29ae9398@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 10:38:51 +0200, Ilias Apalodimas wrote:
> Some packages may require libipset(i.e keepalived introduced in this patch).
> 
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
> ---
>  package/ipset/ipset.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
