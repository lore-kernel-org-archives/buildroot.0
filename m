From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:32:58 +0100
Subject: [Buildroot] [PATCH v3 0/3] Adding mender-artifact
In-Reply-To: <1549459439-2260-1-git-send-email-angelo@amarulasolutions.com>
References: <1549459439-2260-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190317173258.4c8c54ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed,  6 Feb 2019 14:23:56 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Angelo Compagnucci (2):
>   package/go: refactor host/target dependencies
>   package/mender-artifact: new package
> 
> Mirza Krak (1):
>   package/pkg-golang: add support for building host packages

Thanks, series applied. I have entirely rewritten the commit log for
the first patch, because it wasn't at all about refactoring host/target
dependencies, but just about renaming some existing options to prepare
the addition of the BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
