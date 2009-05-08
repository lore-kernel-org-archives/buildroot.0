From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 09:13:24 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 8 May 2009
	01\:52\:27 -0300")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
Message-ID: <877i0scbjf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi Peter,
 Thiago>     I'm newbie with this git thing, so please bear with me...

 Thiago>     Please pull git clone git://git.buildroot.net/~correa/git/buildroot.git for:

 Thiago>  * Update Linux Advanced to 2.6.29.2 - this fixes iptables compile
 Thiago>  * Add dl folder to gitignore
 Thiago>  * Update atngw100_defconfig

I had a quick look, and it basically looks good, but there's a few
things I would like you to fix:

- Please sign off on your fixes (git commit -s)
- Don't commit unrelated things together (Linux advanced together with
  atngw100 defconfig)
- What do you mean with 'this fixes iptables compile'? What does the
  kernel has to do with iptables compilation?

You are welcome to put the fixes for 2009.05 in a seperate branch
(upstream, stable or whatever) if that's easier for you to keep it
seperate for new feature development while we're stabilizing for the
release. I might create a 'next' branch for new stuff.

-- 
Bye, Peter Korsgaard
