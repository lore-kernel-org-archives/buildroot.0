From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 13:49:29 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <CAGm1_ktFjO8KyQTOTDnKo1bLbhjwBpyw7Li=T6sLAf=Vab71=w@mail.gmail.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com>
 <55184DA0.1050901@armadeus.com>
 <20150329224013.0d330434@free-electrons.com>
 <CAGm1_ktFjO8KyQTOTDnKo1bLbhjwBpyw7Li=T6sLAf=Vab71=w@mail.gmail.com>
Message-ID: <20150330134929.09fc5de7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Mon, 30 Mar 2015 13:05:09 +0200, Yegor Yefremov wrote:

> Can confirm, that I'm having the same issue with my German openSUSE
> 12.1 machine. Exporting LANGUAGE=en_US helped. haven't tried LC_ALL
> yet. Python 2.7.9.

Ok.

> The whole stuff got screwed only lately. I've been using python-dpkt,
> that requires PYTHON_ZLIB for ages and had no problems on this
> machine.

Seems weird. Do we have an idea what broke things ? Can you try 2015.02,
2014.11 and see if the issue also happens (or not) ?

> I think this bug (https://bugs.busybox.net/show_bug.cgi?id=7971) is
> also locale related.

Ok.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
