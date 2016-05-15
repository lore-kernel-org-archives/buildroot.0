From: Matthew Weber <matt@thewebers.ws>
Date: Sun, 15 May 2016 16:43:56 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <CAFt09wOkNnAGgjHrrcw8Pg-J0=cqUxGhX9k80uGqS0yP94PBbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, May 14, 2016 at 8:46 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> J?r?me, Gustavo, Bernd, Fabio, Gwenhael, Romain, Vicente, Yann, Matt,
> Martin, Baruch, Samuel, Waldemar, Peter, please see below, there's some
> good stuff for you :-) Thanks!
>
> On Sat, 14 May 2016 08:30:24 +0200 (CEST), Thomas Petazzoni wrote:
>
<snip>
>>       x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/c6a6eec34cffb2c7876595b36fb8a01f475583f9/
>
> Musl build issue. Matt, you originally added the igmpproxy package,
> could you take care of this issue?

Looks like Bernd Kuhls had submitted a patch back in Jan.  I've
retested his patch against this autobr failure and re-submitted the
patch.

Thanks,
Matt
