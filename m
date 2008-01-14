From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 14 Jan 2008 20:52:00 +0100
Subject: [Buildroot] error messages
References: <00b501c853c9$4fc21330$6e00a8c0@JONATHAN><00a601c85644$796a65c0$020514ac@atmel.com><01f101c856c9$be8ff5e0$6e00a8c0@JONATHAN><d6cda7730801140911x5b866f6ew44f96f7f93084f49@mail.gmail.com>
	<022d01c856e1$f8f27a10$6e00a8c0@JONATHAN>
Message-ID: <020401c856e7$d9220a60$e5031a0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,

> This is not something that i'm normaly do on a daily basis. So I have the
> file modified, but I'm try to make a patch. I try with svn diff, but thoses
> file are not part of the svn. So what is the best way of providing a working
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
