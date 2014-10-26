From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:53:32 +0100
Subject: [Buildroot] [PATCH v2 00/16] New package Apache including
 mod_php
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026225332.39ba0d93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  5 Oct 2014 19:38:48 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (16):
>   package/apr: Fix detection of rlimit and large file support
>   package/apr-util: Add expat hard-dependency
>   package/apr-util: Remove unused dependencies to neon and zlib
>   package/apr-util: make sqlite optional
>   package/apr-util: add optional dependency to berkeleydb
>   package/apr-util: add optional dependency to gdbm
>   package/apr-util: add optional dependency to mysql

All applied.

>   package/apr-util: add optional dependency to openssl

I've applied this one, but the v3 you've sent.

>   package/php: Add support for GD module
>   package/php: Add support for mcrypt module
>   package/php: Add support for mbstring module
>   package/apr: Bump version to 1.5.1
>   package/apr: Fix for Apache when listening to multiple ports
>   package/apr-util: Bump version to 1.5.4

All applied.

>   Apache: New package
>   package/php: Add Apache support

I haven't applied those patches, not enough time to review/test them
yet.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
