From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Nov 2020 22:45:06 +0100
Subject: [Buildroot] [PATCH] package/environment-setup: new package
In-Reply-To: <20201027140140.47982-1-matthew.weber@rockwellcollins.com>
References: <20201027140140.47982-1-matthew.weber@rockwellcollins.com>
Message-ID: <20201103224506.33dcba07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Oct 2020 09:01:40 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> Install an helper script to setup a build environment based on buildroot.
> It's useful when a developer wants to use a buildroot generated sdk to
> build an external project.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
> Tested-by: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Maury Anderson <maury.anderson@collins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---

I've applied to master, with a number of small changes. The main is
probably getting rid of the "buildroot shell" terminology. There's no
such thing as a "buildroot shell". There's a script that exports a
number of environment variables and aliases in your current shell.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
