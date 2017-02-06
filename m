From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 6 Feb 2017 17:10:56 +0000 (UTC)
Subject: [Buildroot] Odd comment in openntpd/Config.in
Message-ID: <o7aan0$qvb$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In https://git.busybox.net/buildroot/tree/package/openntpd/Config.in:

config BR2_PACKAGE_OPENNTPD
       bool "openntpd"
       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
       [...]

comment "openntpd needs a toolchain w/ NPTL"
        [...]
        depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

Is the "!" in the comment is a typo?

-- 
Grant Edwards               grant.b.edwards        Yow! If our behavior is
                                  at               strict, we do not need fun!
                              gmail.com            
