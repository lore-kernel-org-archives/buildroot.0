From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 05 Apr 2012 10:04:38 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-04-04
In-Reply-To: <1333610578.2444.3.camel@sven>
References: <20120405063016.2E51252CDF5@lolut.humanoidz.org>
 <1333610578.2444.3.camel@sven>
Message-ID: <fd665aa863fefe1a5f1a45782d9cdbd3@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-05 04:22, Sven Neumann wrote:

> Hi,
>
> I've seen some build failures for gnutls in your logs. We've had
> troubles with gnutls as well. Now it works here with the following
> options:
>
> GNUTLS_CONF_OPT += --disable-cxx --with-libgcrypt
> --without-libgcrypt-prefix --without-p11-kit
>
> You may want to check if that fixes your problems.
>
>
> Regars,
> Sven

ACK in principle if it helps.
Though i haven't hit issues with --with-libgcrypt-prefix in my tests (i 
actually needed it in a gentoo host since it otherwise leaked the host 
libgcrypt version and failed) it still works correctly with 
--without-libgcrypt-prefix (doesn't if neither the old or new are 
present).
Regards.
