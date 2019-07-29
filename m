From: Simon Rowe <simon.rowe@eu.citrix.com>
Date: Mon, 29 Jul 2019 08:46:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: use tirpc when no
 toolchain RPC
In-Reply-To: <20190726231303.372c0130@windsurf>
References: <1564043421-126710-1-git-send-email-simon.rowe@citrix.com>
 <20190726231303.372c0130@windsurf>
Message-ID: <a8deefc9-ff12-6dcd-7007-b19298d7a367@eu.citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/07/2019 22:13, Thomas Petazzoni wrote:

> Thanks for the patch. However, adding the select in Config.in was not
> sufficient: it does not guarantee that libtirpc will be built before
> openvmtools. To ensure it gets built before, libtirpc needs to be added
> to OPENVMTOOLS_DEPENDENCIES.
> 
> So I fixed this issue in your patch, slightly tweaked the commit
> title/log and applied.

Thank you for explaining this, I'll try to remember the need to update 
the makefile in future,

Simon
