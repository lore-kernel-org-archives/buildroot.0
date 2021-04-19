From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:42:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/domoticz: drop boost date-time
 dependency
In-Reply-To: <CAPi7W83EoFQ57YxLranycWgji6rQP4MQ9=_GCAZAKFhE5NJ-tg@mail.gmail.com>
References: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
 <20210418200730.3474374-2-fontaine.fabrice@gmail.com>
 <20210419223424.274df115@windsurf.home>
 <CAPi7W83EoFQ57YxLranycWgji6rQP4MQ9=_GCAZAKFhE5NJ-tg@mail.gmail.com>
Message-ID: <20210419234213.1644ca99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Apr 2021 22:44:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I was working on bumping domoticz to latest version and I noticed this
> change when going through CMakeLists.txt.
> Unfortunately, I should have noticed it sooner (back in 2018) but this
> kind of changes can easily be missed.

Absolutely: it's very easy to spot a missing dependency, as it
typically causes a build failure. But spotting dependencies that are no
longer necessary is much, much trickier, which is why I asked how you
found out this one.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
