From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:58:32 +0100
Subject: [Buildroot] [PATCH] package/libevdev: add dependency on
 host-python
In-Reply-To: <1388233672-16776-1-git-send-email-yann.morin.1998@free.fr>
References: <1388233672-16776-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131228155832.2414bd0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 13:27:52 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> libevdev needs python to generate a header file. We can't rely on the
> 1system pPython, since it may be too old (missing argparse in python
> 2.6).
> 
> Fixes:
>     http://autobuild.buildroot.net/results/1f5c0689ae129ae5fa30f31a4f47ccbd7705ff00/
>     http://autobuild.buildroot.net/results/1729043d9c977a59a4fdd7ccd3d16cfc8aef7678/
>     http://autobuild.buildroot.net/results/3ab080e96576e0012fea853009811247338e665e/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libevdev/libevdev.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
