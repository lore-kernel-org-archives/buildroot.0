From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 09:15:53 +0100
Subject: [Buildroot] [PATCH v6 23/28] package/qt5webengine: add
 libXdamage as XCB dependency
In-Reply-To: <20200217212350.29750-24-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-24-anaumann@ultratronik.de>
Message-ID: <20200312091553.5498289b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:45 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Fixes a build failure.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Could you provide the Buildroot configuration that exhibits the issue?
I've been trying to create a configuration that builds qt5webengine
with X.org enabled, and no matter what I do, the OpenGL provider I use
selects libxdamage, so I don't have a configuration that combines
qt5webengine and X.org, but without having libxdamage.

Also, what was the build failure ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
