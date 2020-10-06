From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:21:06 +0200
Subject: [Buildroot] [PATCH v5 1/1] qt5remoteobjects: new package
In-Reply-To: <20200309120024.1182-1-sven@leiderfischer.de>
References: <20200309120024.1182-1-sven@leiderfischer.de>
Message-ID: <20201006232106.2281985f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Mon,  9 Mar 2020 13:00:24 +0100
Sven Fischer <sven@leiderfischer.de> wrote:

> Qt 5.12 adds a library for IPC.
> 
> Dependency on qtdeclarative is optional.
> 
> Signed-off-by: Sven Fischer <sven@leiderfischer.de>
> ---
> Suggested by Peter Seiderer:
> * help text changes
> * install order changed

Sorry for the long delay, I have now applied your patch! Of course, I
had to update it to Qt 5.15.1, to use the qmake-package infrastructure,
and a few other tweaks.

Don't hesitate to check the latest master, and see if it works for you.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
