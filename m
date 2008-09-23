From: Fathi Boudra <fboudra@gmail.com>
Date: Tue, 23 Sep 2008 16:05:19 +0200
Subject: [Buildroot] broken build rootfs workflow
In-Reply-To: <6a2e33620809220743m4a0d01b2gfabedc6bc9c6cc99@mail.gmail.com>
References: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
	<6a2e33620809180253t4b32032eu399ab6734076f367@mail.gmail.com>
	<87iqssyyxh.fsf@macbook.be.48ers.dk>
	<6a2e33620809220743m4a0d01b2gfabedc6bc9c6cc99@mail.gmail.com>
Message-ID: <6a2e33620809230705k4b7f2985o2d701f19e5d13fbb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Bernard Reutner-Fischer, he find a solution to my issue.

for the track: builroot configuration file is propagated to
uClibc/buildroot.

My uClibc was modified because it isn't synced to buildroot configuration.

example:
You must enable IPV6 in buildroot if you want to have IPV6 support in
uClibc.
Otherwise, it will be automatically disable in uClibc configuration file,
whatever you set inside.

cheers,

Fathi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080923/5507531e/attachment.htm 
