From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 23:07:37 +0200
Subject: [Buildroot] [PATCH] package/mono: bump to version 6.0.0.313
In-Reply-To: <20190728151829.18851-1-angelo@amarulasolutions.com>
References: <20190728151829.18851-1-angelo@amarulasolutions.com>
Message-ID: <20190801230737.6e6a8de1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Sun, 28 Jul 2019 17:18:29 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> This patch bumps mono to version 6.0.0.313 and it's related
> dependency monolite to version d0aa6798-834d-11e9-b38a-3b0d70487d01.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

You forgot to update the hash of mono's LICENSE file, whose content
changed. So I've updated the hash, and extended the commit log with
some explanations about why the license file hash change is not
relevant for the <pkg>_LICENSE variable. See:

  https://git.buildroot.org/buildroot/commit/?id=74d9e5d9b8d0fff633463aaf9a41533469822ed0

Please remember to run make <pkg>-legal-info after bumping a package,
or use test-pkg, which runs legal-info as part of its tests.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
