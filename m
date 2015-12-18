From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 11:41:17 +0100
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
In-Reply-To: <20151217222952.28cfb35c@free-electrons.com>
References: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
 <20151217222952.28cfb35c@free-electrons.com>
Message-ID: <20151218114117.5d273ce1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Dec 2015 22:29:52 +0100, Thomas Petazzoni wrote:

> Other than that, I couldn't spot any issue, so I applied. Don't
> hesitate to monitor http://autobuild.buildroot.org and/or the daily
> autobuild report e-mails to see if there are any libgdiplus related
> failures.

There are some build issues:

  http://autobuild.buildroot.org/?reason=libgdiplus-3.12

There is a -L/lib somewhere which is wrong. Could you have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
