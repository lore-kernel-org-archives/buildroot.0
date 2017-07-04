From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 09:01:15 +0200
Subject: [Buildroot] [PATCH 1/2 v2] package/tz: fix variable name
In-Reply-To: <ac47ce5aaeb022761a1645d1173188097311c9a8.1499151384.git.yann.morin.1998@free.fr>
References: <cover.1499151384.git.yann.morin.1998@free.fr>
 <ac47ce5aaeb022761a1645d1173188097311c9a8.1499151384.git.yann.morin.1998@free.fr>
Message-ID: <20170704090115.157973d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 08:56:38 +0200, Yann E. MORIN wrote:
> The tz packages mizes its own variable with the one fro the tzdata
> package...
> 
> Fix the variable name in tz.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexandre BELLONI <alexandre.belloni@free-electrons.com>
> ---
>  package/tz/tz.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, after fixing the typos in the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
