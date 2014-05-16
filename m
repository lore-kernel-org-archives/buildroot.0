From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 21:16:57 +0200
Subject: [Buildroot] [PATCH] package/avahi: does not build with
	static-only
In-Reply-To: <20140516184954.GA3466@free.fr> (Yann E. MORIN's message of "Fri, 
 16 May 2014 20:49:54 +0200")
References: <1400256681-30273-1-git-send-email-yann.morin.1998@free.fr>
 <20140516201650.5805db3e@free-electrons.com>
 <20140516184954.GA3466@free.fr>
Message-ID: <87ha4pr0t2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Autobuilder reference?

 > Gah, I forgot to add it...

 > Fixes (which I reproduced here):
 >     http://autobuild.buildroot.net/results/ea2/ea2c8f20c4032bf82876805ea787a55834091cec

 > Should fix (which I did not even try to reproduce):
 >     http://autobuild.buildroot.net/results/4ef/4ef5bfc17f50bddb00f7ef3d62fc1fe963b7da82
 >     http://autobuild.buildroot.net/results/76e/76e4854812b0ef3862c080eead4012b35ef27f0f
 >     http://autobuild.buildroot.net/results/5bf/5bfb3fd9fe61bef5f998dc5999ce2060c334662c
 >     http://autobuild.buildroot.net/results/dc6/dc607c35471ef6dda04e06ad05ae7794615af578
 >     [...]

 > I'll respin it later with those references added...

Thanks. Please also adjust the reverse dependencies (xbmc). Does this
dependency apply to all of avahi, or just the daemon?

-- 
Bye, Peter Korsgaard
