From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:08:29 +0200
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.7.9
In-Reply-To: <162b5a636bb13959aa40bd3ccc1479b9228bfa75.1504109223.git.baruch@tkos.co.il>
References: <162b5a636bb13959aa40bd3ccc1479b9228bfa75.1504109223.git.baruch@tkos.co.il>
Message-ID: <20170830220829.0d3e1269@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 19:07:03 +0300, Baruch Siach wrote:
> Fixes CVE-2017-0379: Mitigate a local side-channel attack on Curve25519
> dubbed "May the Fourth be With You".
> 
> As we are close to release, don't update to the latest 1.8.1 version,
> but to a maintenance release from the 1.7 branch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libgcrypt/libgcrypt.hash | 6 ++----
>  package/libgcrypt/libgcrypt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
