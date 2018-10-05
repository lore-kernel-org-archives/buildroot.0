From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 5 Oct 2018 14:21:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: add upstream
 patches
In-Reply-To: <20181005064525.28631-1-F.LaRoche@pilz.de>
References: <20181005064525.28631-1-F.LaRoche@pilz.de>
Message-ID: <20181005122132.GC31472@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,

> Add patches from the upstream ltp-testsuite github
> repository to compile correctly.

> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> ---
>  package/ltp-testsuite/0002-execve05.patch | 44 +++++++++++++++++++++++
>  package/ltp-testsuite/0003-statx.patch    | 32 +++++++++++++++++
>  package/ltp-testsuite/0004-statx.patch    | 26 ++++++++++++++

This is a duplicate patch of patch sent in
http://lists.busybox.net/pipermail/buildroot/2018-October/232173.html
https://patchwork.ozlabs.org/patch/979320/

Kind regards,
Petr
