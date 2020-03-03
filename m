From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:55:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200228173052.5128-1-petr.vorel@gmail.com>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
Message-ID: <20200303225528.4fe98de9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 18:30:51 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...ltiple-definiton-with-gcc-fno-common.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/libtirpc/0005-Avoid-multiple-definiton-with-gcc-fno-common.patch

Is this for master or next ? Are you talking about gcc 10 for the host
or gcc 10 for the target ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
