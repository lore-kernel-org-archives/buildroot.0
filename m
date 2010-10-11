From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 11 Oct 2010 13:43:12 +0300
Subject: [Buildroot] Gtk on Arm
In-Reply-To: <936170.19773.qm@web95703.mail.in.yahoo.com>
References: <AANLkTikDGchiLkpU0vEiWJGOD7BbCq1CUzu5UHOM4AUN@mail.gmail.com>
	<936170.19773.qm@web95703.mail.in.yahoo.com>
Message-ID: <AANLkTimXzbr94ecWKEwtmkw=zsjVnqRTMxQWZDLrhSdc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 11, 2010 at 1:33 PM, Giriprasad Deviprasad <g_pr21@yahoo.in>wrote:

>
> Isn't this line saying anything to you?
>
>  ? ? -*- libpng
>
>
> It shows as follows:
> Library for handling PNG (Portable Network
> Graphics)                                                  ?
>   ?
> images.
> ?
>
> ?
> ?
>   ? http://www.libpng.org/
> ?
>
> ?
> ?
>   ? Symbol: BR2_PACKAGE_LIBPNG [=y]
>
>
> But downloads directory has no file for gtk such as gtk+-2.14.7.tar.bz2.
>
>
>
Oh come on... Look above my comment.
You must enable WCHAR and C++ somewhere in Toolchain section!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101011/751eff5e/attachment.html>
