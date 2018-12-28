From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 18:21:59 +0100
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228182159.02a8a6c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 11:43:27 +0100, Thomas Petazzoni wrote:

> Here is a seventh iteration of the per-package SDK and target
> directory implementation, offering top-level parallel build
> capability.

Regarding top-level parallel build, I prepared this Wiki page that
documents the progress of the effort:

  https://elinux.org/Buildroot:Top_Level_Parallel_Build

Especially, I'd like to make it clear: this patch series is only the
*core* support for per-package directories. There are a number of fixes
needed for Meson, Python and more to make it usable with some packages.
I wanted to keep this patch series reasonable in size by only
submitting the core support.

If you want to do some testing, please use
https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v7-work
which has all the fixes I currently have.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
