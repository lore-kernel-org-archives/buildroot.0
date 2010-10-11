From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 11 Oct 2010 13:07:16 +0300
Subject: [Buildroot] Gtk on Arm
In-Reply-To: <421492.46040.qm@web95707.mail.in.yahoo.com>
References: <421492.46040.qm@web95707.mail.in.yahoo.com>
Message-ID: <AANLkTikDGchiLkpU0vEiWJGOD7BbCq1CUzu5UHOM4AUN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 11, 2010 at 12:48 PM, Giriprasad Deviprasad <g_pr21@yahoo.in>wrote:

> Hi All,
>
>  I am trying to cross compile Gtk+ for the arm architecture (
> www.hawkboard.org). I have enabled the following options in the
> menuconfig:
>        [*]
> cairo
> ? ?
>   ? ?              [*]   postscript
> support                                                             ? ?
>   ? ?              -*-   pdf
> support                                                                    ?
> ?
>   ? ?              -*-   png
> support                                                                    ?
> ?
>   ? ?              [*]   svg
> support                                                                    ?
> ?
>   ? ?              -*-
> fontconfig
> ? ?
>   ? ?              -*-
> freetype
> ? ?
>   ? ?              [ ]
> jpeg
> ? ?
>   ? ?              [*]
> libart
> ? ?
>   ? ?                  *** libgtk2 requires a toolchain with WCHAR and C++
> support ***                  ? ?
>

Isn't this line saying anything to you?


>   ? ?              -*-
> libpng
>
>
> When I do a make, it downloads and compiles all required software like
> cairo/pango etc,except gtk. Can any one please let me know, what option to
> enable for including the gtk in the cross compile. I am using
> buildroot-2010.08.tar.bz2.
>
> Thanks & Regards,
> D.Giriprasad
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101011/32d47c54/attachment-0001.html>
