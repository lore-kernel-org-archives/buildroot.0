From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:28:35 +0100
Subject: [Buildroot] [PATCH] package/python-shutilwhich: also available
 in python3
In-Reply-To: <20171230103008.1828-1-yann.morin.1998@free.fr>
References: <20171230103008.1828-1-yann.morin.1998@free.fr>
Message-ID: <20171230182835.72a7f87b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 11:30:08 +0100, Yann E. MORIN wrote:
> When in python3, shutilwhich will simply use shutil.which.
> 
> Some packages (e.g. crossbar.io) unconditionally require shutilwhich,
> even when they are running under python3.
> 
> So, enable python-shutilwhich even for python3.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Mauro Condarelli <mc5686@mclink.it>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-shutilwhich/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
