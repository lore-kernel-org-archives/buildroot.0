From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 10:01:06 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <CALR4fE+x+juTYQfZyjzK+je_MAU59pJSarKSxNLR_iRvdy-1qg@mail.gmail.com>
 (Diego Iastrubni's message of "Wed, 20 Jul 2011 10:44:31 +0300")
References: <201107191222.19313.arnout@mind.be>
 <87aaca4l1y.fsf@macbook.be.48ers.dk>
 <201107191323.36347.arnout@mind.be>
 <CALR4fE+x+juTYQfZyjzK+je_MAU59pJSarKSxNLR_iRvdy-1qg@mail.gmail.com>
Message-ID: <87ipqx2xfh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

Hi,

 Diego> .. or... we can revert?ca520507fc15a8213334a76339a3e6d567e91ea0
 Diego> ... as I have seen 2-3 people have been reporting similar
 Diego> problems is the last few months.

That wouldn't really change anything for people using devtmpfs or mdev,
and as devtmpfs gets used more and more (E.G. systemd requires it) and
brings a number of advantages, I think it's a sensible thing to require.

-- 
Bye, Peter Korsgaard
