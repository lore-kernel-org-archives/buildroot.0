From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 11:47:02 +0100
Subject: [Buildroot] [PATCH v3] support/misc: Adding Vagrant file for
 provisioning
In-Reply-To: <CA+TH9Vni80B2u4toCMZdBq0pj-YycNk9b1yTNULPMWMFapKfnw@mail.gmail.com>
References: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
 <8737t8xx5a.fsf@dell.be.48ers.dk>
 <CA+TH9Vni80B2u4toCMZdBq0pj-YycNk9b1yTNULPMWMFapKfnw@mail.gmail.com>
Message-ID: <20160220104701.GB3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2016-02-05 09:05 +0100, Angelo Compagnucci spake thusly:
> 2016-02-04 17:23 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
> > Next to Yanns comments I would prefer to use wget like we do elsewhere
> > in Buildroot to download stuff.
> 
> Argh! That curl was on purpose (probably I'm a novice in the buildroot
> world, but not completely thoughtless!), wget it's not distributed
> with Mac Os X and it's quite an accomplishment installing it [1].

Three things:

  - wget is available from MacPorts, Homebrew and Fink; it is easy to
    install; their documentation is pretty explicit (at leat for me who
    does not even have a Mac, and never ever touched one).

  - if you consider wget to be hard to install, what about Vagrant? I
    doubt it is installed on a stock MacOS; surely the user will *have*
    to install stuff on his system...

  - if someone is not able to replace the wget incantation with a similar
    curl incantation (or the opposite), then there's a deeper problem;
    this is really 101 [1]...

So, totally irrelevant...

> I'll send a patch soon.

Which has already been applied, which is a little bit sad... :-(

[1] https://en.wikipedia.org/wiki/101_%28number%29#In_education

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
