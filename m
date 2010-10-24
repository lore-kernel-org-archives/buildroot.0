From: Don Smyth <dsmyth@signett.com>
Date: Sat, 23 Oct 2010 23:38:13 -0700
Subject: [Buildroot] java support in buildroot
Message-ID: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have java support working in buildroot using an external toolchain
(CodeSourcery Lite arm) (jamvm, classpath & concierge) with minor
changes to the jamvm and concierge package makefiles.

Is that sufficient to keep java support in buildroot (I see that it is
marked broken and scheduled to be removed)?

The problem with jamvm and classpath under the native buildroot
toolchain seems to be with building against uClibc -- my external
toolchain is glibc. Should also work with a ct-ng toolchain configured
for glibc.

I can submit the patches if anyone else would find this useful.

----
Don Smyth - dsmyth at signett.com
