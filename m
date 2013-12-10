From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 10 Dec 2013 20:05:32 +0400
Subject: [Buildroot] mono runtime porting to buildroot
In-Reply-To: <000b01ceef4c$9a7ded20$cf79c760$@elgsis.com>
References: <000b01ceef4c$9a7ded20$cf79c760$@elgsis.com>
Message-ID: <52A73BCC.30309@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was letter by kerim.fryer at gmail.com from 01.11.2013, and he
provided mono package:
http://lists.busybox.net/pipermail/buildroot/2013-November/081553.html

I have also made a package for mono, just before I saw above package.
So I have a patch that is not well tested. I am attaching my patch so
you can try it if you want.

If you find something that fits your need, you can try making good patch
for upstream.

02.12.2013 14:52, Linas Lisauskas ?????:
>
> Hi,
>
> I have a question. Maybe somebody of Your team tried to port mono
> project for buildroot. I was using openembedded dist, but is the
> requirement to use buildroot dist and mono project. Can anyone help
> write *.mk file for this? I have cross compiled mono project with
> native buildroot toolchain.
>
> Thanks.
>
> ------------
>
> Best regards,
>
> Embedded Software Engineer
>
> Linas Lisauskas
>
> Elgama Sistemos, Ltd.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-mono-new-package.patch
Type: text/x-patch
Size: 3105 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131210/671d4a7b/attachment.bin>
