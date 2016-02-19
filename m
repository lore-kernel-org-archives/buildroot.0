From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 22:17:40 +0100
Subject: [Buildroot] [PATCH v4 03/17] python-lmdb: new package
In-Reply-To: <1454799603-5474-4-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-4-git-send-email-mc5686@mclink.it>
Message-ID: <20160219221740.578fa72e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Sat,  6 Feb 2016 23:59:49 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> 
> ---
> Changes v3 -> v4
>   - removed spurious blank line at end of Config.in (suggested by yegorich)
>   - yegorich inquired about double licensing; I left as-is because it is
>     like that in PKG-INFO file ("License: OpenLDAP BSD").
>     No LICENSE file is present in package sources.

I've applied to next, but had to do a few changes on the licensing side
mainly:

    [Thomas:
     - switch to Github, which has a LICENSE file. The issue was reported
       upstream: https://github.com/dw/py-lmdb/issues/108. Then added the
       <pkg>_LICENSE_FILES variable.
     - bump version to 0.89 (instead of 0.88)
     - indicate the proper license, following the SPDX code for the
       OpenLDAP 2.8 license.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
