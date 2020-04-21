From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 23:17:10 +0200
Subject: [Buildroot] [PATCH] package/python-markdown: fix Python version
 dependency
In-Reply-To: <20200310114101.6726-1-yegorslists@googlemail.com>
References: <20200310114101.6726-1-yegorslists@googlemail.com>
Message-ID: <20200421231710.30b7f293@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 12:41:01 +0100
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The latest version has dropped Python 2 support.

"The latest version" is very vague. Read this statement in 6 months,
and it no longer makes sense. I've extended the commit log quite a bit:

  https://git.buildroot.org/buildroot/commit/?id=1e5723ee589e8d205883c15ca863c01f94b8854f

and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
