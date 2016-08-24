From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Aug 2016 09:35:27 -0400
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAKmqyKOYZuW7WeHmP7iatLPJzEudzEnnxnDJYi5oWt=uDTQQkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-08-23 8:47 GMT-04:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
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
> +# N:   Firstname Lastname <email>
> +# F:   file pattern or directory
> +# F:   file pattern or directory
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
> +N:     Abhishek Singh <abhishek.singh@imgtec.com>
> +F:     package/cxxtest/
> +
> +N:     Adam Duskett <aduskett@gmail.com>
> +F:     package/nginx-naxsi/
> +
> +N:     Alex Suykov <alex.suykov@gmail.com>
> +F:     package/vboot-utils/
> +
> +N:     Alexander Clouter <alex+buildroot@digriz.org.uk>
> +F:     package/odhcp6c/
> +
> +N:     Alexander Dahl <post@lespocky.de>
> +F:     package/fastd/
> +F:     package/libuecc/
> +F:     package/putty/
> +
> +N:     Alexander Lukichev <alexander.lukichev@espotel.com>
> +F:     package/openpgm/
> +
> +N:     Alexander Varnin <fenixk19@mail.ru>
> +F:     package/liblog4c-localtime/
> +
> +N:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
> +F:     package/tz/
> +
> +N:     Alistair Francis <alistair.francis@xilinx.com>
> +F:     package/xen/
> +

Can I please have a second email added?

Alistair Francis <alistair23@gmail.com>

I need to keep my company email here, but it is much easier to do list
work from my gmail. If not what's here now is fine.

Thanks,

Alistair

[...]

> --
> 2.7.4
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
