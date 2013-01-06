From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 22:02:00 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 6 Jan 2013 21:56:20 +0100")
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
Message-ID: <877gnqf2k7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> replacement for memcpy and memset functionality

 Maxime> This package was originally found at :
 Maxime> https://github.com/huceke/buildroot-rbp By gimli
 Maxime> <ebsi4711@gmail.com>

The package looks ok from a quick look, but how is it supposed to be
used? I wouldn't like to see patches to a bunch of packages to link
against this.

It isn't really rpi specific either.

-- 
Bye, Peter Korsgaard
