From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:28:24 +0200
Subject: [Buildroot] [PATCH] download/git: clarify why .git is removed
In-Reply-To: <20170420063647.30741-1-ricardo.martincoski@gmail.com>
References: <20170420063647.30741-1-ricardo.martincoski@gmail.com>
Message-ID: <20170420222824.1d5954d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Apr 2017 03:36:47 -0300, Ricardo Martincoski wrote:
> The removal of the .git dir before creating the tarball is not anymore
> just an optimization. It is necessary to make the tarball reproducible.
> Also, without the removal, large tarballs (gigabytes) would be created
> for some linux trees.
> 
> Update the comment accordingly.
> 
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> first removing .git, then not removing .git
>      630730 fio-fio-2.13.tar.gz
>     1369791 fio-fio-2.13.tar.gz

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
