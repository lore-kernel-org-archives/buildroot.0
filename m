From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 05 Apr 2012 09:22:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-04-04
In-Reply-To: <20120405063016.2E51252CDF5@lolut.humanoidz.org>
References: <20120405063016.2E51252CDF5@lolut.humanoidz.org>
Message-ID: <1333610578.2444.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've seen some build failures for gnutls in your logs. We've had
troubles with gnutls as well. Now it works here with the following
options:

GNUTLS_CONF_OPT += --disable-cxx --with-libgcrypt --without-libgcrypt-prefix --without-p11-kit

You may want to check if that fixes your problems.


Regars,
Sven
