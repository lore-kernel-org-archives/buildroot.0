From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 May 2009 21:59:01 +0200
Subject: [Buildroot] [GIT PULL] For 2009.05-rc2
In-Reply-To: <d6cda7730905131410s1d88ebdm2c8000e4f28715d9@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 13 May 2009
	18\:10\:26 -0300")
References: <d6cda7730905131309t2c0f8f21m2841072f983c71ac@mail.gmail.com>
	<87skj8rbz0.fsf@macbook.be.48ers.dk>
	<d6cda7730905131410s1d88ebdm2c8000e4f28715d9@mail.gmail.com>
Message-ID: <87ljozpibe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> Is there some way that we could stream line this? So far this
 Thiago> git move have done nothing than double or triple the amount
 Thiago> of work I need to do to submit.  After that I still need to
 Thiago> do the work that will actually bring the food on the table.

Well, it's a matter of viewpoint ofcourse - But to me it has made it
easier to work with. The extra review before commits are imho a good
thing.

You could enable the post-receive hook on your repo to get it to
automatically send patches to the list when you push changes to it
(see .git/hooks/post-receive.sample).

 Thiago> First one has to figure out git, then he has to setup
 Thiago> sendmail or ssmtp or procmail, whatever. Personally I don't
 Thiago> really like to leave my password in plain text in any
 Thiago> /etc/*.conf

True, all tools require some setup. I would expect most developer
machines to be able to send mail and/or have git installed already
though as lots of projects use it.

 Thiago> I think we should find a model that is easy and works for us,
 Thiago> not for the linux kernel with countless people, lots of
 Thiago> mailling lists and several subsystems with maintainers for
 Thiago> each.

What exactly isn't working for you? I can understand that it takes a
bit of time to learn git if you haven't used it before, but other than
that?

-- 
Bye, Peter Korsgaard
