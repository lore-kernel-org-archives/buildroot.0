From: Michael Rommel <rommel@layer-7.net>
Date: Sat, 14 Sep 2013 16:46:31 +0200
Subject: [Buildroot] Building pyzmq
In-Reply-To: <CALoHCLNrOptvEKwsErhHS8go9M-UB=H=9MPGzvXcqpFP4xeMmA@mail.gmail.com>
References: <CALoHCLNrOptvEKwsErhHS8go9M-UB=H=9MPGzvXcqpFP4xeMmA@mail.gmail.com>
Message-ID: <F41243CA-E279-40E7-A6BE-9B8441CBE297@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Eric,

I believe the last version of my patch for python-pyzmq addresses the error.
I sent it to the mailinglist a few minutes ago.

If you can test it, I'll be glad to hear your feedback.

  Michael.

-- 
Michael Rommel, Erlangen, Germany

On Aug 29, 2013, at 22:35 , Eric Seifert <eric.seifert@cyaninc.com> wrote:

> Hello, I am using ZeroMQ and need to build the python bindings for it.
> I added a python-pyzmq package for it and am having some compilation
> errors. The package is python but has a native extension, so is
> compiled. 
