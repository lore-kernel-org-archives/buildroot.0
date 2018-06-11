From: Patrick Doyle <wpdster@gmail.com>
Date: Mon, 11 Jun 2018 15:12:16 -0400
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <CAF_dkJDwfTvVHmSVgi4mo=2u=-Yj-__3e7rqsOyUXppLPeysEQ@mail.gmail.com>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
 <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
 <20180407084321.1e68cc90@windsurf.home>
 <CAF_dkJDwfTvVHmSVgi4mo=2u=-Yj-__3e7rqsOyUXppLPeysEQ@mail.gmail.com>
Message-ID: <CAF_dkJAH5u3g_rQYaUVzCnUMyeMTMZrRbo0KDnOt6pVQtwvb-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
Remember this thread from last April?

Suppose I wanted to generate and host my own prebuilt toolchain.
Suppose I really liked the existing
armv7-eabihf--musl--stable-2018.02-2 toolchain, but I really wanted to
use 4.9 kernel headers instead of 4.1.  How would I generate and
archive the toolchain for my own use?

And, as long as I have your attention, what is the difference between
the 2018.02-1 and 2018.02-2 toolchains anyway?  They seem to have the
same set of GCC, GDB, Linux headers, library, and binutils versions.

--wpd
