From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 12:17:13 +0100
Subject: [Buildroot] problems configuring libcurl
In-Reply-To: <49B634A0.30600@unix-beratung.de> (Robert Urban's message of
	"Tue\, 10 Mar 2009 10\:36\:32 +0100")
References: <49B5BA80.5090103@unix-beratung.de>
	<87tz61aigp.fsf@macbook.be.48ers.dk> <49B634A0.30600@unix-beratung.de>
Message-ID: <87ljrdaapy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:

Hi,

 Robert> bash: project_build_i586/robix/root/bin/grep:
 Robert> /lib/ld-uClibc.so.0: bad ELF interpreter: No such file or
 Robert> directory -snip-

 >> Please post your .config

 Robert> .config can be found at:

 Robert> 	http://www.spielwiese.de/rob/Buildroot/config

It builds fine here (on a x86_64 host though). I'll change the target
to x86_64 and try again.

What distribution are you using?

-- 
Bye, Peter Korsgaard
