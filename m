From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 16:38:27 +0100
Subject: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to
 packages menu
In-Reply-To: <alpine.DEB.2.11.1601241724060.4122@tanhuma.tkos.co.il>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-2-git-send-email-yba@tkos.co.il>
 <20160124160920.0fb91f86@free-electrons.com>
 <alpine.DEB.2.11.1601241724060.4122@tanhuma.tkos.co.il>
Message-ID: <20160124163827.7984d2e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben Avraham,

On Sun, 24 Jan 2016 17:33:24 +0200 (IST), Jonathan Ben Avraham wrote:

> That is, one patch should look something like
> 
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
>   +	source "package/yp-tools/Config.in"
>  	source "package/znc/Config.in"

This change should be part of the patch adding package/yp-tools/.

> and the other should look like
> 
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
>   +	source "package/ypbind-mt/Config.in"
>  	source "package/znc/Config.in"

This change should be part of the patch adding package/ypbind-mt/

> And then we rely on the order of the application of the patches to 
> determine the order of the items in the final Config.in?

Yes. A series is a list of patches that are ordered. They will be
applied in the order they are listed in your series. Many series have
patches that have dependencies between each other, that's the whole
purpose of sending them as a series rather than independently.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
