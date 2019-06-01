From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:11:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/network-manager: drop
 --disable-ifnet
In-Reply-To: <20190601105351.21675-1-fontaine.fabrice@gmail.com>
References: <20190601105351.21675-1-fontaine.fabrice@gmail.com>
Message-ID: <20190601151109.007668ed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Jun 2019 12:53:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ifnet has been drop since version 1.12.0 and
> https://github.com/NetworkManager/NetworkManager/commit/0474441e2258eeecb356e2aa3cde5c7328828646
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/network-manager/network-manager.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
