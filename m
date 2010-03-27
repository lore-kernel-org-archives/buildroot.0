From: Thomas Brandstetter <thomas.brandstetter@me.com>
Date: Sat, 27 Mar 2010 21:12:39 +0100
Subject: [Buildroot] uclibc and gcc tls
Message-ID: <81E98B2D-4CAA-4230-80C3-4F78CF7C5F76@me.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm building Buildroot with Uclibc and gcc 4.4.3. Actually, I got an error during the pcre build:

i686-linux-uclibc/lib/libstdc++.so: undefined reference to `___tls_get_addr'

I searched for uclibc problems and found out that uclibc doesn't support tls. Can you please integrate a check which disables the BR2_GCC_ENABLE_TLS option for uclibc building toolchains?

thx

cheers Thomas
