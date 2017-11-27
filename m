From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 15:13:24 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
 <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
Message-ID: <20171127151324.187c5a60@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 15:01:29 +0100, Johan Oudinet wrote:

> > Also, perhaps this is something our PowerPC64 friends from IBM could
> > help fixing? Sam? Joel?  
> 
> I've asked for an account.
> In the meantime, looking for Erlang users on powerpc64le (I barely use
> it myself and have no such architecture at my disposal), it looks like
> this was fixed in OTP 20:
> https://bugs.erlang.org/browse/ERL-369

Interesting. So it seems like passing --disable-hipe would work around
the problem for ppc64le, correct ?

Or perhaps better we just backport
https://github.com/erlang/otp/pull/1394/commits ?

> From Erlang website, it looks like OTP 20 and OTP 20.1 have been
> released. May Erlang maintainer's (Will Newton) bump the version?

Will Newton has not been active in Buildroot since 2014, so I'm not
sure he intends to bump Erlang. Could you do this instead, and add
yourself for erlang in the DEVELOPERS file ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
