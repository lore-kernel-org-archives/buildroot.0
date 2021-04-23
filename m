From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:14:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: needs dynamic library
In-Reply-To: <20210422205256.707037-1-fontaine.fabrice@gmail.com>
References: <20210422205256.707037-1-fontaine.fabrice@gmail.com>
Message-ID: <20210423231458.5c9b1884@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 22:52:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable gerbera with static builds as it raises build failures since
> bump to version 1.8.0 in commit 8974596836945eada8e162844fb87f88adec9100
> and upstream does not seem to care or test static builds:
> https://github.com/gerbera/gerbera/issues/1221
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9c59ef912d09bb3c0647b98aa8e9eca7fccbe08f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gerbera/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
