From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 15:38:37 +0200
Subject: [Buildroot] [PATCH 1/1] Adding the Scrypt key derivation
 library.
In-Reply-To: <CANeaEXGaudiymi+4JKxCvLTJVqBfckNWCqT+DPMBOWJJsMBuZw@mail.gmail.com>
References: <CANeaEXGaudiymi+4JKxCvLTJVqBfckNWCqT+DPMBOWJJsMBuZw@mail.gmail.com>
Message-ID: <20150828153837.23d25cbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Parnell Springmeyer,

Thanks for your contribution!

You should normally send patches inline (using git send-email) rather
than as an attachment. This allows to more easily review your patch by
simply replying to your e-mail.

That being said, for this first patch, I applied it to our next branch,
after doing quite a few changes:

    [Thomas:
      - move from "Libraries -> Crypto" to "System tools", since it only
        installs one binary, scrypt, and no library.
      - bump from 1.1.6 to 1.2.0
      - add comment in the .hash file explaining where the hash is coming
        from.
      - add missing dependency on OpenSSL
      - use BSD-2c as the license code, instead of BSD2
      - use 'main.c' as the license file.]

I messed up a bit when committing, since I committed your original
patch, and then separately my changes. But at least this way you can
clearly see what I have changed:

  http://git.buildroot.net/buildroot/commit/?h=next&id=84face61cf1dfefe864d6d47976932a32bbde9f2
  http://git.buildroot.net/buildroot/commit/?h=next&id=0d83de383224c65ec250a005130b1d3cc6fd6d76

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
