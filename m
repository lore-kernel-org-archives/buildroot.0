From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 28 Jul 2012 22:00:13 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: add
	libglib2-libtool-remove-builddir-from-rpath.patch
In-Reply-To: <20120728213120.7408f668@skate>
References: <1343493006-5152-1-git-send-email-s.martin49@gmail.com>
 <20120728213120.7408f668@skate>
Message-ID: <CAHXCMMKURaAkPjAZr2q-eN_dWNEfEcKcN-+5ascQ1eEU3LTxDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Thomas,

2012/7/28 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello,
>
> A description + sign-off in the patch is missing.
Oops! Forgot to add it.

>  Also ltmain.sh isused in all packages using libtool, so why is this patch specific to
> libglib2? Will we have to carry a similar patch for all libtool-based packages?
AFAIK, so far, libglib2 is the only package messing up rpath.

I wondered the same thing about making it available for all
autotools/libtool-based packages before posting the patch.
But the truth is, outside libglib2, I don't know what could be  the
side effects (hope there is none ;-) ).

Besides, checking support/libtool, I've noticed 3 versions of libtool;
I know libglib2 is patched with buildroot-libtool-v2.4.patch, so this
patch fits for libtool-2.4, but I don't know about the other versions.


Anyway, before reposting the patch, I'll try making it available for
all libtool-based packages and I'll report here.


Regards,

-- 
Sam
