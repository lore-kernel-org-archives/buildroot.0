From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Oct 2010 21:20:09 +0200
Subject: [Buildroot] java support in buildroot
In-Reply-To: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
	(Don Smyth's message of "Sat, 23 Oct 2010 23:38:13 -0700")
References: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
Message-ID: <8739rodcwm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Don" == Don Smyth <dsmyth@signett.com> writes:

 Don> I have java support working in buildroot using an external toolchain
 Don> (CodeSourcery Lite arm) (jamvm, classpath & concierge) with minor
 Don> changes to the jamvm and concierge package makefiles.

 Don> Is that sufficient to keep java support in buildroot (I see that it is
 Don> marked broken and scheduled to be removed)?

 Don> The problem with jamvm and classpath under the native buildroot
 Don> toolchain seems to be with building against uClibc -- my external
 Don> toolchain is glibc. Should also work with a ct-ng toolchain configured
 Don> for glibc.

Ahh, thats good to hear.

 Don> I can submit the patches if anyone else would find this useful.

Yes please.

-- 
Bye, Peter Korsgaard
