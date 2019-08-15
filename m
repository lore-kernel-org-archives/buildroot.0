From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 23:18:44 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5enginio/Config.in: depends
 before select
In-Reply-To: <20190815204341.29566-1-arnout@mind.be>
References: <20190815204341.29566-1-arnout@mind.be>
Message-ID: <20190815231844.623c60dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 22:43:41 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> In Config.in, we put 'depends' lines before 'select' lines, as reported
> by check-package.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/273215267
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Tsk tsk, Thomas, committing stuff without running check-package :-)

Meh :-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
