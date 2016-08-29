From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 29 Aug 2016 12:19:54 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <6cfc163d-8a6a-20a3-8eae-b2cb7ee65746@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 23/08/2016 14:47, Thomas Petazzoni wrote:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).

Nice initiative !

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  DEVELOPERS | 1542 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1542 insertions(+)
>  create mode 100644 DEVELOPERS
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> new file mode 100644
> index 0000000..3742a73
> --- /dev/null
> +++ b/DEVELOPERS
> @@ -0,0 +1,1542 @@
> +# Syntax:
> +#
> +# N:	Firstname Lastname <email>
> +# F:	file pattern or directory
> +# F:	file pattern or directory
> +#
> +# The "F" entries can be:
> +#
> +# - A directory, in which case all patches touching any file in this
> +#   directory or its subdirectories will be CC'ed to the developer.
> +# - A pattern, in which case the pattern will be expanded, and then
> +#   all files/directories (and their subdirectories) will be
> +#   considered when matching against a patch
> +#
> +# Notes:
> +#
> +# - When a developer adds an "arch/Config.in.<arch>" file to its list
> +#   of files, he is considered a developer of this architecture. He
> +#   will receive e-mail notifications about build failures occuring on
> +#   this architecture. Not more than one e-mail per day is sent.
> +# - When a developer adds a directory that contains one or several
> +#   packages, this developer will be notified when build failures
> +#   occur. Not more than one e-mail per day is sent.
> +# - When a developer adds an "package/pkg-<infra>.mk" file to its list
> +#   of files, he is considered interested by this package
> +#   infrastructure, and will be CC'ed on all patches that add or
> +#   modify packages that use this infrastructure.
> +

> [....]
> +
> +N:	Julien Boibessot <julien.boibessot@armadeus.com>
> +F:	configs/armadeus*
> +F:	package/libcddb/

+ board/armadeus/*
+ package/gpm
+ package/lbreakout2
+ package/libmodbus
+ package/ltris
+ package/opentyrian
+ package/pygame
+ package/smstools3

[...]

Thanks !

Regards,
Julien
