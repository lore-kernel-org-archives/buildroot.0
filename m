From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 21:58:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: new package
In-Reply-To: <20200202134730.3840832-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 2 Feb 2020 14:47:30 +0100")
References: <20200202134730.3840832-1-fontaine.fabrice@gmail.com>
Message-ID: <87mu9z1j7r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The RocksDB library provides a persistent key value store. Keys and
 > values are arbitrary byte arrays. The keys are ordered within the key
 > value store according to a user-specified comparator function.

 > The library is maintained by the Facebook Database Engineering Team, and
 > is based on LevelDB, by Sanjay Ghemawat and Jeff Dean at Google.

 > http://rocksdb.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  DEVELOPERS                                    |   1 +
 >  package/Config.in                             |   1 +
 >  .../rocksdb/0001-Check-for-sys-auxv.h.patch   |  85 ++++++
 >  ...to-disable-building-shared-libraries.patch | 244 ++++++++++++++++++

check-package complains about your missing signed-off-by here, so I've
added that and committed, thanks.

-- 
Bye, Peter Korsgaard
