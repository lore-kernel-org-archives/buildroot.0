From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Feb 2009 08:23:55 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
In-Reply-To: <499E05A7.2070403@unix-beratung.de> (Robert Urban's message of
	"Fri\, 20 Feb 2009 02\:21\:43 +0100")
References: <499E05A7.2070403@unix-beratung.de>
Message-ID: <87bpsv6ik4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:

 Robert> Hi Folks,
 Robert> I'm getting the following error when trying to build openswan, as part of a
 Robert> 'make all':

Our openswan support is very old (from ~2006), and that one apparently
doesn't like current kernel headers.

I tried updating to openswan-2.6.20, but that also has various build
problems. I don't know anything about openswan (and frankly, I don't
care much about it), so unless someone will step up and support/fix it
up, I'll mark it as broken and remove it after the next release.

Bernhard, you were the one adding it in the first place - What do you
say?

-- 
Bye, Peter Korsgaard
