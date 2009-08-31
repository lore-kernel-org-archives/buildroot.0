From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 Aug 2009 10:15:47 +0200
Subject: [Buildroot] bash fails to compile with git tree
In-Reply-To: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
	(Daniele Salvatore Albano's message of "Fri\,
	28 Aug 2009 11\:21\:13 +0200")
References: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
Message-ID: <87pracqtzg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniele" == Daniele Salvatore Albano <d.albano@gmail.com> writes:

 Hi,

 Daniele> have someone tried to compile bash? Yesterday, trying to fix
 Daniele> my buildroot to send patches i moved my tree and cloned the
 Daniele> head to get a working one (i got some problems with git) but
 Daniele> when i tried to compile my root system, without applying any
 Daniele> patches i done (i was just waiting to get errors to apply
 Daniele> patches), bash failed to compile with a strange reason:
 Daniele> missing termcap.h

 Daniele> Checking ncurses and bash make files seems all ok, and making
 Daniele> a diff with my old tree showed no differences. Toolchain works
 Daniele> perfectly because i can build mi initrd (i use two separate br
 Daniele> trees) without any problem and that br2 is from git and is up
 Daniele> to date too. I don't build bash on my initrd, only busybox
 Daniele> with few stuff.

 Daniele> I can't send my .config, i'm at work, when i'll get at home
 Daniele> i'll send it, however someone got problems building bash?

Is this with an external toolchain? I just did a quick test build on
i686 with the normal internal toolchain and bash builds without problems
here.

-- 
Bye, Peter Korsgaard
