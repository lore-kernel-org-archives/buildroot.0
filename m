From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:38:26 +0200
Subject: [Buildroot] [PATCH 23/83 v2] package/udpcast: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <6f0ca434a3a4e6b42e7fee883ddd1dd88b46787d.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <6f0ca434a3a4e6b42e7fee883ddd1dd88b46787d.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233826.3bde3ea5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:34 +0200, Yann E. MORIN wrote:
> This is a bit overkill, as there is only two sub-items. However, this
> commit is not about judging whether it makes sense or not to have a
> sub-menu, but to cleanup the 'config'+'menu' situation.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Instead, I've replaced this by a commit that simply removes the
menu ... endmenu.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
