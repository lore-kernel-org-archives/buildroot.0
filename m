From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 11:35:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] Update github hashes
In-Reply-To: <20170921091359.5693-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 21 Sep 2017 11:13:59 +0200")
References: <20170921091359.5693-1-bernd.kuhls@t-online.de>
Message-ID: <87poakwg1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > It seems github now sometimes provides slightly changed tarballs which
 > produce a different sha256 hash than before. This commit fixes the
 > hashes of the packages when sources.buildroot.net does not store a copy
 > of the tarball matching the current hash.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: Only update those packages where sources.buildroot.net does not
 >     store a copy of the previous tarball (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
