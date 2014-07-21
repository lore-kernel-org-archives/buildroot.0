From: Waldemar Brodkorb <wbx@uclibc-ng.org>
Date: Mon, 21 Jul 2014 21:35:23 +0200
Subject: [Buildroot] [OpenWrt-Devel] uClibc-ng
In-Reply-To: <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
 <20140721204239.61b225fe@free-electrons.com>
 <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
Message-ID: <20140721193522.GK4431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,
Florian Fainelli wrote,

> To speak my mind, I think uClibc has no future in the next 2 or 3
> years, musl is a much more active project, with multiple embedded
> projects starting to use it, on the other end, (e)glibc has remedied
> its own problems and its useful again.

I am on your site here. But the 2-3 years must be become such a bad
time for embedded users? 
We already have separate repositories for ARC and NPTL support and for
Xtensa and NPTL. We have different projects all using different
patch sets on top of 0.9.33.x. Buildroot, OpenWrt, OpenEmbedded,
Freetz, Bering-Uclibc, OpenADK, Aboriginal (musl switch is in work).

I do not see such a bad split-off in musl. Why? Because musl have a 
responsive and active maintainer. 
 
> Bottom line is, I believe uClibc is a (relatively speaking) dead
> project already, forking it might be useful to keep the existing user
> base alive, but I expect all of them to transition to something active
> and maintained, whether that's glibc or musl.

Sure, and that is totally okay for me. I just wanna make the
existing userbase happy for the time, they can not switch to musl or
glibc. Why not make the transition smooth?

best regards
 Waldemar
