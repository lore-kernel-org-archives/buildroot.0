From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:03:31 +0100
Subject: [Buildroot] [PATCH] configs: atmel: sama5d3xek: bump to
 linux4sam_5.5
In-Reply-To: <20161110084530.11208-1-ludovic.desroches@atmel.com>
References: <20161110084530.11208-1-ludovic.desroches@atmel.com>
Message-ID: <20161110110331.4801da78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 09:45:30 +0100, Ludovic Desroches wrote:
> Bump to linux4sam_5.5 and remove dtb variants which are no longer
> supported.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d3xek_defconfig | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)

Applied to master, after adding a note in the commit log that says this
is needed to fix the build with gcc 5.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
