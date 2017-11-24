From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 15:28:16 +0100
Subject: [Buildroot] [PATCH/next v2 3/3] package/python-mwclient: bump
 version to 0.8.6
In-Reply-To: <20171112104523.16791-3-bernd.kuhls@t-online.de>
References: <20171112104523.16791-1-bernd.kuhls@t-online.de>
 <20171112104523.16791-3-bernd.kuhls@t-online.de>
Message-ID: <20171124152816.021c5ae6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Nov 2017 11:45:23 +0100, Bernd Kuhls wrote:
> Version 0.8.2 added OAuth support so we need python-requests-oauthlib
> as runtime dependency from now on. This package also has a runtime
> dependency on python-requests so all we need is to update the select
> command in Config.in.
> 
> Removed patch applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: no changes

Apparently this update is causing a new build failure:
http://autobuild.buildroot.net/results/79e/79ef04d2e8c91231028e23f4bb35df685efa55ca/build-end.log.

Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
