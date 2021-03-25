From: Alassane <alassaneg@gmail.com>
Date: Thu, 25 Mar 2021 13:44:04 +0100
Subject: [Buildroot] PHP installation issues
In-Reply-To: <CAJ2YAHtdmiVyOZJNZbaWpGon15hznYV815QAhgKe4KY7YBBdmQ@mail.gmail.com>
References: <CAJ2YAHtdmiVyOZJNZbaWpGon15hznYV815QAhgKe4KY7YBBdmQ@mail.gmail.com>
Message-ID: <CAJ2YAHu7_rnwA8Qe8juPXW18cNdozfO7i=CN4owL6NUYWWD9FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Do you have any idea of what the issue could be?

Kind regards

Thank you

Le lun. 22 mars 2021 ? 15:13, Alassane <alassaneg@gmail.com> a ?crit :

> Hello,
>
> I have tried to generate a linux image with buildroot2020.11.1 but i'm
> having some issues after that.
> First of all, i've activated the external php extension "php-imagick" in
> target package after i run "make menuconfig".
> After that, i perform a full rebuild, reflash my sd card, launch my target
> but when i run the commande "php -m", it doesn't show me the "imagick"
> module...
> And this is the following error message i'm facing when trying to run a
> program with the "php" command : *PHP Fatal error:  Uncaught Error: Class
> 'Imagick' not found*
>
> Also, i've selected the php "iconv" package and facing this error when i
> try to run my php program : *PHP Notice:  iconv(): Unknown error (22).*
>
> Do you know where these issues i'm facing could potentially come from?
>
> Kind regards
>
> Thank you
>
> Alassane
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210325/c5bfa49b/attachment.html>
