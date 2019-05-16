From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 16 May 2019 08:08:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] iputils: Bump to version s20190324
In-Reply-To: <20190514184217.67249ce9@windsurf>
References: <20190509224508.14526-1-petr.vorel@gmail.com>
 <20190514184217.67249ce9@windsurf>
Message-ID: <20190516060840.GA28502@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> It looks mostly good, but I have a few nits and questions.

> First, the commit should be prefixed by "package/iputils", not just
> "iputils", and "Bump" should be "bump", i.e lowercase.
Thanks for pointing out buildroot preference (I always wondered whether use
'packages/' prefix; lowercase after colon is much preferred generally, but
I've seen often upercase, so I adapt to it).
> This of course I
> had fixed locally, but I had more nits/questions, so I couldn't apply
> as-is.

...
> > -IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\

> So the USE_SYSFS=no and USE_IDN=no are no longer needed / no longer
> exist ?
Thanks for review, sorry for silly errors.
I've fixed all questions in v3 (using new release I didn't need to backport
build fixes).


Kind regards,
Petr
