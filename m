From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 00:08:34 +0100
Subject: [Buildroot] [PATCH v7] package/i2c-tools: bump to version 4.0
In-Reply-To: <1513868050-6206-1-git-send-email-angelo@amarulasolutions.com>
References: <1513868050-6206-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20171229000834.0432518d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Dec 2017 15:54:10 +0100, Angelo Compagnucci wrote:
> This patch bumps i2c-tools to version 4.0 and adds a couple of
> new commands named i2ctransfer and eeprog.
> It adds also several upstream commits not included in the release
> that fix static compilation issues and parallel build issues.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changes:

Applied to master, thanks. I couldn't reproduce any parallel build
failure with this iteration. Let's see if the autobuilders agree!

And thanks for your work on this package update!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
