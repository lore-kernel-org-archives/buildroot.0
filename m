From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:28:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/php: fix gd dependencies
In-Reply-To: <20200418090343.140078-2-aussedat.louis@gmail.com> (Louis
 Aussedat's message of "Sat, 18 Apr 2020 11:03:43 +0200")
References: <20200418090343.140078-1-aussedat.louis@gmail.com>
 <20200418090343.140078-2-aussedat.louis@gmail.com>
Message-ID: <87bln1einm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Louis" == Louis Aussedat <aussedat.louis@gmail.com> writes:

 > Due to migration to pkg-config in php 7.4, the detection of
 > library dependencies has been changed.

 > source from php.net:
 > --with-gd becomes --enable-gd
 > --with-png-dir has been removed. libpng is required.
 > --with-zlib-dir has been removed. zlib is required.
 > --with-freetype-dir becomes --with-freetype
 > --with-jpeg-dir becomes --with-jpeg

 > Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
