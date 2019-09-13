From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:17:23 +0200
Subject: [Buildroot] [PATCH] package/luksmeta: bump to version v9
In-Reply-To: <20190912201438.9985-1-peter@korsgaard.com>
References: <20190912201438.9985-1-peter@korsgaard.com>
Message-ID: <20190913221723.48d0654f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Sep 2019 22:14:37 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Bugfix release, fixing a potential infinite loop when handling the LUKS
> header:
> 
> git shortlog v8..v9
> Daniel Kope?ek (2):
>       Use asciidoc as the manual page source format
>       Generate manual page from source during build time
> 
> Milan Broz (1):
>       Fix infinite loop when initializing trimmed LUKS header.
> 
> Nathaniel McCallum (3):
>       Fix invalid man page section reference
>       Fix typos in the man page
>       Release version 9
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/luksmeta/luksmeta.hash | 2 +-
>  package/luksmeta/luksmeta.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
