From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 12 Mar 2014 23:14:06 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: disable documentation
In-Reply-To: <1394147900-16917-1-git-send-email-romain.naour@openwide.fr>
References: <1394147900-16917-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5320DC2E.3000104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 07/03/2014 00:18, Romain Naour a ?crit :
> Add --disable-docs option in the configure script.
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v3: Remove useless "else" in Makefile.am (Arnout)
>      Fix test "$wantdocs" = "yes"
>      Add Documentation install status (yes/no)
>      upstream status: patch sent
>
> v2: Add an option in configure script
>      instead of patching the Makefile (Arnout)
>      upstream status: it's not sent yet
> ---
>   .../imagemagick-02-Add-disable-docs-option.patch   | 86 ++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 package/imagemagick/imagemagick-02-Add-disable-docs-option.patch
>
>
This patch has been merged in imagemagick trunk and it's now available
in the new imagemagick 6.8.8-8 release :)

So, I'll remove it from patchwork.

Best regards,
Romain Naour
