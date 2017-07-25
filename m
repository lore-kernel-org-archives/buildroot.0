From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:46:47 +0200
Subject: [Buildroot] [PATCH] python-toml: add host variant of the package
In-Reply-To: <20170725045132.363-1-andrew.smirnov@gmail.com>
References: <20170725045132.363-1-andrew.smirnov@gmail.com>
Message-ID: <20170725214647.51f5a3b0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 21:51:32 -0700, Andrey Smirnov wrote:
> Add host variant of the package to make it availible to custom host
> tools that might want to use it.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Since we still don't have Config.in options for all host packages, I
continue to be reluctant to add such patches, because host packages
like this are never tested by the autobuilders: there are no target
packages that use them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
