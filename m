From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 02 Jan 2010 09:20:43 +0100
Subject: [Buildroot] uClibc-0.9.30.1 build missing file
In-Reply-To: <1262398377.4627.13.camel@RoadRunner> (Nicolae T.'s message of
	"Fri, 01 Jan 2010 18:12:57 -0800")
References: <1262398377.4627.13.camel@RoadRunner>
Message-ID: <87k4w0yl2c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolae" == Nicolae T <microvis@cox.net> writes:

 Nicolae> Hello and Happy New Year to all,
 Nicolae> It appears uClibc build misses an archive file. It occurs on more than one
 Nicolae> snapshot.
 Nicolae> Does anybody run into it? Is there a fix to it?
 Nicolae> Thanks.

libgcc.a is from gcc - Are you using an external toolchain?

Please post your .config file.

-- 
Bye, Peter Korsgaard
