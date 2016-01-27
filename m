From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:34:19 +0100
Subject: [Buildroot] [PATCH] updated the package lxc to latest version
 1.1.5
In-Reply-To: <CAGE8XjpWtgOtDLB1k+finr8ck0tpTXXLh03mqbPu=LfMVjHkjw@mail.gmail.com>
References: <1453894151-30929-1-git-send-email-santosh.multhalli@rockwellcollins.com>
 <20160127132359.645387ae@free-electrons.com>
 <CAGE8XjpWtgOtDLB1k+finr8ck0tpTXXLh03mqbPu=LfMVjHkjw@mail.gmail.com>
Message-ID: <20160127213419.0042d5cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Santosh,

On Wed, 27 Jan 2016 19:32:17 +0530, Santosh Multhalli wrote:

> the download location of lxc package has been moved from
> https://linuxcontainers.org/downloads
> to
> https://linuxcontainers.org/downloads/lxc
> so I think we need to change LXC_SITE as well

Indeed. The old location still works, but redirects to the new one, so
I've changed Bernd's patch to use the new location.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
