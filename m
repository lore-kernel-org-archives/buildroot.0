From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:27:08 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/uclibc: backport static
 linking fixes
In-Reply-To: <20200909172547.380537-1-petr.vorel@gmail.com>
References: <20200909172547.380537-1-petr.vorel@gmail.com>
Message-ID: <20201006212708.09b2698c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Wed,  9 Sep 2020 19:25:47 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Fixes:
>      - http://autobuild.buildroot.net/results/645/6453da1471398e8c788e5b86abc4bf2e83e6c0b2
>      - http://autobuild.buildroot.net/results/64d/64db6fcb132896ef3552b52ea743d53d05133982
>      - http://autobuild.buildroot.net/results/938/938729c42d52bd9e74454bc34b2b20c4e0503142
>      - http://autobuild.buildroot.net/results/bc5/bc50834820c921ce4927f23e4dcfa2aaa405c657
>      - http://autobuild.buildroot.net/results/a15/a156ffcbe16af4b2f5440dad06c6985b8fcd045e
> 
> Suggested-by: Waldemar Brodkorb <wbx@openadk.org>
> Suggested-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

We now have updated to 1.0.36 in master, so this patch is no longer
needed in master.

However, it could be useful for the 2020.08.x branch.

It is not useful for the 2020.02.x however, because 2020.02.x did not
have gcc 10.x support.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
