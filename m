From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 4 Dec 2010 12:34:00 -0600
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
In-Reply-To: <1291484261.14151.2480.camel@coalu.atr>
References: <003201cb93d6$8162a080$8427e180$@zuerker.org>	<1291483060.14151.2478.camel@coalu.atr>	<004501cb93d7$a9c039b0$fd40ad10$@zuerker.org>
	<1291484261.14151.2480.camel@coalu.atr>
Message-ID: <004c01cb93e1$d1f3eda0$75dbc8e0$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(sorry, this time with a reply to the list)

Hey,

Here's the error message:
gconvert.c:65:2: error: #error GNU libiconv not in use but included iconv.h is from libiconv

config.log without --with-libiconv=gnu 
http://pastebin.com/WB433xVu

config.log with --with-libiconv=gnu
http://pastebin.com/rbgZ6Saw

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org 
