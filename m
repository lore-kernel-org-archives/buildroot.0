From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:06:21 +0200
Subject: [Buildroot] [PATCH] package/network-manager: support WEXT
 drivers which report mode AUTO
In-Reply-To: <1464625995-566-1-git-send-email-iluxave@gmail.com>
References: <1464625995-566-1-git-send-email-iluxave@gmail.com>
Message-ID: <20160611160621.2efee70c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 May 2016 19:33:15 +0300, Ilya A. Volynets-Evenbakh wrote:
> From: "Ilya A. Volynets-Evenbakh" <ilya@total-knowledge.com>
> 
> Some wireless drivers report IW_MODE_AUTO instead of IW_MODE_MANAGED.
> NetworkManager 1.0.12 introduced a change, which makes it skip such
> interfaces.
> 
> This patch is a backport of a workaround for this problem from the
> NetworkManager upstream.
> 
> Signed-off-by: Ilya A. Volynets-Evenbakh <ilya@total-knowledge.com>
> ---
>  .../0002-accept-auto-mode-interfaces.patch         | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/network-manager/0002-accept-auto-mode-interfaces.patch

I've added a reference to the upstream commit in the patch itself, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
