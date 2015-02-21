From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:45:52 +0100
Subject: [Buildroot] [PATCH 04/10 v7] package/mesa3d-headers: also
 install dri header and .pc file
In-Reply-To: <a88ca46ce32c884d4aeea74af80f1ebbcff9dc16.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <a88ca46ce32c884d4aeea74af80f1ebbcff9dc16.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150221174552.4abaf2af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 10 Feb 2015 21:01:11 +0100, Yann E. MORIN wrote:
> Building GL with Xorg requires the DRI interface.
> 
> Provide that header and pkg-config file for those binary blobs
> that do not provide them.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
