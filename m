From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 18:25:41 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvblast: needs threads
In-Reply-To: <f9ad87dc2c39526c794c35b9f05eb2d354d31639.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
 <f9ad87dc2c39526c794c35b9f05eb2d354d31639.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <20151031182541.0e685c25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 30 Oct 2015 16:43:42 +0100, Yann E. MORIN wrote:
> Fixes;
>     http://autobuild.buildroot.org/results/c25/c25143fd1363d162de6733bc55a84289543f4da3/
>     http://autobuild.buildroot.org/results/09d/09d9a962b20295d09d7777f873f7bb1c8130dbf1/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julian Scheel <julian@jusst.de>

I've applied but now that I'm re-reading when replying to your e-mail,
I see a mistake:

> +comment 'dvblast needs a toolchain w/ threads'

We normally use double quotes, not single quotes for comments.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
