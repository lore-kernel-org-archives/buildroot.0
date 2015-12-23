From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 23 Dec 2015 00:44:06 -0800
Subject: [Buildroot] LIB_SYMLINK in top-level Makefile
Message-ID: <CAKbGBLgHuT-cQh4SW_NMBJ9iSpf_gan_3cjRn3Kc4pT+bEtTZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Are the LIB_SYMLINK definitions in the top-level Makefile defined at
the time they're used in package/skeleton/skeleton.mk? It looks like
those lines didn't get moved along with the rest of the bits from the
$(STAGING_DIR) target.
