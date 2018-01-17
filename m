From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 23:41:08 +0100
Subject: [Buildroot] [PATCH 4/5] python-see: new package
In-Reply-To: <20180111092520.28438-4-yegorslists@googlemail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-4-yegorslists@googlemail.com>
Message-ID: <20180117234108.1935ccf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Jan 2018 10:25:19 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                  |  1 +
>  package/python-see/Config.in       |  6 ++++++
>  package/python-see/python-see.hash |  4 ++++
>  package/python-see/python-see.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-see/Config.in
>  create mode 100644 package/python-see/python-see.hash
>  create mode 100644 package/python-see/python-see.mk

Applied to master, thanks. Just curious: why are you adding this
package? It seems to only do a cosmetic thing, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
