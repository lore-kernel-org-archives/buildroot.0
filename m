From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 22:02:51 +0200
Subject: [Buildroot] [PATCH] package/wireshark: properly guard
 sub-options
In-Reply-To: <1476993401-11776-1-git-send-email-yann.morin.1998@free.fr>
References: <1476993401-11776-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161020220251.13ccf94f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 21:56:41 +0200, Yann E. MORIN wrote:
> ... otherwise we would end up forcefully enabling the linguist tool even
> when wireshark would not be enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/wireshark/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
