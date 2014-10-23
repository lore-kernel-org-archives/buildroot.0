From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 18:01:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-22
In-Reply-To: <54491A5C.6030802@mind.be>
References: <20141023063017.0B8391011FF@stock.ovh.net>
 <20141023082416.GG2220@tarshish>
 <20141023140156.0e6bbc8b@free-electrons.com>
 <54491A5C.6030802@mind.be>
Message-ID: <20141023180141.2515ed1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 23 Oct 2014 17:10:20 +0200, Arnout Vandecappelle wrote:

> > That is indeed a very good question. In some sense, having -Werror
> > enabled when --enable-debug is passed is quite legitimate.
> 
>  No, I disagree with that. --enable-debug should be an option to enable anything
> that makes runtime debugging easier - sometimes it enables extra debugging
> output for instance.  -Werror is something which is only really valid for
> continuous integration.

So in other words, your suggestion is to patch the package so that it
does *not* use -Werror even when --enable-debug is used, correct?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
