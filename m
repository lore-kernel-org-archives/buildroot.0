From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 15:07:40 +0100
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <1479126748.3874.28.camel@synopsys.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
 <1479126748.3874.28.camel@synopsys.com>
Message-ID: <20161114150740.394bdd02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 12:32:29 +0000, Vlad Zakharov wrote:

> We apologize for coming late with that update.
> But could you please apply it on master as it is important for us to come up with latest kernel in upcoming Buildroot release.
> Updated configs were build- and run tested on corresponding platforms, so there shouldn't be any regressions there.

Once -rc1 has passed, we don't apply version bumps (be it to packages
or defconfigs), unless they fix a specific issue.

What is the issue with having this update part of 2017.02 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
