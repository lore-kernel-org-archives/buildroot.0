From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:38:02 +0100
Subject: [Buildroot] [PATCH 1/2] board/qemu/ppc64-pseries: adjust Qemu
 command line
In-Reply-To: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
References: <20171121080815.31347-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127223802.1e1200e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Nov 2017 09:08:14 +0100, Thomas Petazzoni wrote:
> This helps the toolchains.free-electrons.com build logic re-use
> directly the Qemu command lines from this readme.txt file, by having a
> -append option similar to the ones used in other readme.txt files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  board/qemu/ppc64-pseries/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master. Thanks Yann for the review :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
