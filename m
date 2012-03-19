From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Mar 2012 11:46:50 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
In-Reply-To: <CAM+bi4tg=4ywjQYrWDP7_zQ_fvUzCYFpySjz-siZKFhwNYJwVw@mail.gmail.com>
 (Alvaro Gamez's message of "Mon, 19 Mar 2012 11:32:46 +0100")
References: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
 <20120319105120.7dcafd10@skate>
 <CAM+bi4tyqL-zYyb7AC7kRPgGvedUoHok=Vkn-xdHJuZbs-PyGw@mail.gmail.com>
 <20120319112026.592985ee@skate>
 <CAM+bi4tg=4ywjQYrWDP7_zQ_fvUzCYFpySjz-siZKFhwNYJwVw@mail.gmail.com>
Message-ID: <878viwkgv9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:

 Alvaro> Ah, that's better! The package I was looking at as reference is
 Alvaro> ezxml and is much more repetitive.

That's because ezxml's makefile doesn't have a usable install target. If
vnstat has, then you can just call it.

-- 
Bye, Peter Korsgaard
