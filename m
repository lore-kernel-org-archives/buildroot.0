From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 00:45:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: fix license hash
In-Reply-To: <20190731211104.3817-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 31 Jul 2019 23:11:04 +0200")
References: <20190731211104.3817-1-fontaine.fabrice@gmail.com>
Message-ID: <87y30d6cxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Hash of license file was not updated after bump to version 1.1.23, year
 > and authors were updated by:
 > - https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=7a6c8a0df1b685d788fd4d3763681bb3018806d7
 > - https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=d6dcd4185bddff34724d6d539f834e9daf7dcf3d

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bbf81a9f44768894c1a55bb1bac6728aff6f2431

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
