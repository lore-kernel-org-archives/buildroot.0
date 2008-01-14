From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 14 Jan 2008 16:51:18 -0500
Subject: [Buildroot] TR:  error messages
Message-ID: <028401c856f7$9802cb90$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here the result patch.

I hope I done the right thing. This is my first patch !!!

Even with the correction I always have errors. 

Jonathan

-----Message d'origine-----
De?: Ulf Samuelsson [mailto:ulf at atmel.com] 
Envoy??: 14 janvier 2008 14:52
??: Jonathan Dumaresq; buildroot at uclibc.org
Objet?: Re: [Buildroot] error messages

> Hi,

> This is not something that i'm normaly do on a daily basis. So I have the
> file modified, but I'm try to make a patch. I try with svn diff, but
thoses
> file are not part of the svn. So what is the best way of providing a
working
> patch ?
> Regards
> Jonathan


==>

$ svn add <file>
$ svn diff

    or create two trees and do

$    diff -urN <original tree> <new tree>    >   mychanges.patch




Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

-------------- next part --------------
A non-text attachment was scrubbed...
Name: bzero.patch
Type: application/octet-stream
Size: 25848 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080114/de44a4e1/attachment-0001.obj 
