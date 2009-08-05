From: gilles TALIS <gilles.talis@gmail.com>
Date: Wed, 5 Aug 2009 15:28:17 +0200
Subject: [Buildroot] Issue using an external toolchain
Message-ID: <c8515bdc0908050628h28decb57nd2f7456c61999f40@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I saw that this topic has been raised many times in the buildroot
discussions but I could not find an answer to my problem.
I tired using CodeSourcery ARM 2008q3 toolchain (built with glibc) with
buildroot and could finally build the software I needed.

Unfortunately, I am facing a strange problem I don't know about to go passed
it.
When I get to the "Welcome to Buildroot" prompt, the login process asks for
a password. When I use a toolchain I have built myself using
uClibc/crosstool-ng, I am never requested to provide a password.

I tried "root", "admin" whatever as password but it does not work.
Can someone help me and also explain to me why I get requested the password
now?

thanks
Gilles.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090805/4901711e/attachment.htm>
