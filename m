From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 4 Jan 2017 16:03:22 +0100
Subject: [Buildroot] support request
In-Reply-To: <1664581242.536141483536330903.JavaMail.httpd@webmail-40.iol.local>
References: <1664581242.536141483536330903.JavaMail.httpd@webmail-40.iol.local>
Message-ID: <CAKAx1ci5w1zOqtM5uJP_KnoesjuBqO+gDW0T9+iXQpVPoj--nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simone,


On Wed, Jan 4, 2017 at 2:25 PM, sred_94 at libero.it <sred_94@libero.it> wrote:

> Dear Sirs,
>
> I need to add the "xmlsec1" package on buildroot, but it has a
> "autogen.sh" script to create the configure file. How can I run this script
> before configuring and building the package?
> Thanking you in advance.


?I think you should try with:

XMLSEC1_AUTORECONF = YES?

See here:
https://buildroot.org/downloads/manual/manual.html#autotools-package-reference


>
> Simone Rossi
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

?Best regards,
Lionel?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170104/0174584f/attachment.html>
