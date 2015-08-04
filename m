From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:18:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] dawgdic: new package
In-Reply-To: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
References: <1438593363-32653-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150804111848.4e6c8402@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Mon,  3 Aug 2015 12:16:03 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> The dawgdic package provides object files and utilities for building and
> accessing directed acyclical word graph (DAWG) dictionaries.
> 
> This version of the patch uses the updated GitHub dawgdic repo instead of the
> Google Code repo used in the previous version of this patch.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>

Patch applied, but I had to do quite a bit of changes:

    [Thomas:
      - use the github macro for <pkg>_SITE
      - remove <pkg>_SITE_METHOD, useless once you use the github macro
        for <pkg>_SITE
      - fix the license, it is BSD-3c and not GPLv3
      - remove commented <pkg>_SITE in the .mk file
      - add missing dependency on C++.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
