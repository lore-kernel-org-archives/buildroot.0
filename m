From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 13:24:32 +0200
Subject: [Buildroot] [PATCH] support/download/file: fix file:// protocol
 handling
In-Reply-To: <1525683042-21087-1-git-send-email-angelo@amarulasolutions.com>
References: <1525683042-21087-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180507132432.32241f44@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Mon,  7 May 2018 10:50:42 +0200, Angelo Compagnucci wrote:
> This patch removes the file:// prefix from file url before passing it
> to the cp command. It fixes also a missing / between url directory
> and file part.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I think it would be good to add a specific example that was failing for
you: an example defconfig, and the relevant part of the build log. This
will help in the future if we wonder why this change was done.

Indeed, your commit log describes *what* is done (which is easily
guessed by looking at the code itself), but not *why* it is done.

I think it is especially important to explain that it is a regression
(and since when).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
