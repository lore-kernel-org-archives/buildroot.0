From: steve caster <steve@c2root.be>
Date: Sat, 8 Nov 2008 13:55:41 +0100
Subject: [Buildroot] openssl extract problem
In-Reply-To: <000001c93de7$a0188130$e0498390$@be>
References: <db2a8a5aa9a6e1044ee4fc0ce95602f8@bugs.uclibc.org>
	<000001c93de7$a0188130$e0498390$@be>
Message-ID: <000001c941a1$4eab5080$ec01f180$@be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem is solved with the latest svn update
Don't know what it was, but works now


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of steve caster
Sent: maandag 3 november 2008 20:09
To: buildroot at uclibc.org
Subject: [Buildroot] openssl extract problem

Hi all,

I am trying to compile openssl, but it gives me an bzip2 error which seems
quite normal when trying to bunzip a .gz file. The main question is, where
can I modify this as I don't see a .mk with the bzip command?

Regards
S.

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
