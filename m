From: Diego Iastrubni <diegoiast@gmail.com>
Date: Sun, 29 Jan 2012 17:26:49 +0200
Subject: [Buildroot] [RFC 14/15] foobar: create a fake proprietary
 package (testing only)
In-Reply-To: <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
Message-ID: <CALR4fELbaToSJw6qJHWJ=hF8TBA4gMsN49eTaiESt+PJRytoUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 29, 2012 at 5:11 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> This is only for testing the proprietary package handling, not to be
> committed in any serious repository.
>
> +FOOBAR_LICENSE = PROPRIETARY
>
> +++ b/package/foobar/source/foobar.c
> @@ -0,0 +1,7 @@
> +#include <stdlib.h>
> +
> +int main(void)
> +{
> + ?printf("Hello, World!\n");
> + ?return 0;
> +}


<sarcasm>
OMG OMG... buildroot is forking into a?proprietary?applications DB...
where is ./ where we need them?
</sarcasm>

/me takes a cup of water and relaxes... ;-)
