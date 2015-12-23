From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Dec 2015 11:10:06 +0100
Subject: [Buildroot] LIB_SYMLINK in top-level Makefile
In-Reply-To: <CAKbGBLgHuT-cQh4SW_NMBJ9iSpf_gan_3cjRn3Kc4pT+bEtTZw@mail.gmail.com>
References: <CAKbGBLgHuT-cQh4SW_NMBJ9iSpf_gan_3cjRn3Kc4pT+bEtTZw@mail.gmail.com>
Message-ID: <CAAXf6LVRhAeK-TtOFNOAgwV36=ouRsA2KCYAh1Etk39XDLfVuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Dec 23, 2015 at 9:44 AM, Steven Noonan <steven@uplinklabs.net> wrote:
> Are the LIB_SYMLINK definitions in the top-level Makefile defined at
> the time they're used in package/skeleton/skeleton.mk? It looks like
> those lines didn't get moved along with the rest of the bits from the
> $(STAGING_DIR) target.

They are defined, so functionally things are fine, but nevertheless it
would have been cleaner if they'd had been moved.

Anyway, see related patch http://patchwork.ozlabs.org/patch/560003/
which moves the definitions in toolchain/helpers.mk.

/Thomas
