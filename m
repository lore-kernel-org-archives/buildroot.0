From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:53:05 +0100
Subject: [Buildroot] [PATCH v2 1/7] mkpimage: new host package
In-Reply-To: <1445340745-1000-2-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <20160322235305.0e6478cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Oct 2015 13:32:19 +0200, Jan Viktorin wrote:
> The tool helps to create a working SPL to boot Altera SoC FPGA boards.
> 
> The code of mkpimage is integrated directly from the Barebox repository
> as stated in the 'mkpimage.mk' file.
> 
> This tool is *NOT* necessary for any other boards so far.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Tested-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
> v1 -> v2: dropped Go implementation, included mkpimage.c from Barebox
>           because of a wierd URL that cannot be hanled by Buildroot
> ---
>  package/mkpimage/mkpimage.c  | 287 +++++++++++++++++++++++++++++++++++++++++++
>  package/mkpimage/mkpimage.mk |  22 ++++
>  2 files changed, 309 insertions(+)
>  create mode 100644 package/mkpimage/mkpimage.c
>  create mode 100644 package/mkpimage/mkpimage.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
