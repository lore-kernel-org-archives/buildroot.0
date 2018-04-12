From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:42:18 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: new package
In-Reply-To: <1523533473-20081-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523533473-20081-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180412214218.3dea90d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 13:44:33 +0200, Guillaume W. Bres wrote:
> Reaver is a tool to audit networks against brute WPS pins attacks.
> 
> It is a generic autotools package, easy to build. Tests passed for the 7 default
> toolchains. 
> 
> It is mandantory to use the github.com/t6x fork that I set in reaver.mk
> at the moment because other versions/repos of this project won't cross-compile.
> Their makefiles are pretty outdated. It is the only updated and regularly maintained
> repo that I found for this project at the moment.
> 
> I added an extra mention about this in package/reaver/reaver.mk
> as suggested by Thomas. I also removed other non related modifications.

You shouldn't put the changelog inside the commit log... but rather

> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---

here, below the "---" mark.

So, I've adjusted a bit the commit log, rewrapped the Config.in help
text where the lines were too short, and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
