From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Dec 2019 08:36:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/xxhash: bump to version 0.7.2
In-Reply-To: <20191207193930.650926-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Dec 2019 20:39:30 +0100")
References: <20191207193930.650926-1-fontaine.fabrice@gmail.com>
Message-ID: <8736dvl14a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove patch (already in version)
 > - Update hash of LICENSE file and remove xxhsum.c from
 >   XXHASH_LICENSE_FILES as LICENSE contains both licenses
 >   (BSD-2-Clause and GPL-2.0+) since
 >   https://github.com/Cyan4973/xxHash/commit/330444389b5091db1fae1cc58c890b9f99b8b35d
 > - Update XXHASH_LICENSE to specify that BSD-2-Clause is for the library
 >   and GPL-2.0+ for xxhsum CLI

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
