From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 19:19:55 +0100
Subject: [Buildroot] [PATCH v8] package/pound: Fix build with OpenSSL
 1.1.x
In-Reply-To: <1549386456-27450-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 11:07:36 -0600")
References: <1549386456-27450-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87ef8mkshg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Bernd Kuhls <bernd.kuhls@t-online.de>
 > The patches enable two new API configurations, one for OpenSSL 1.1.x
 > and the other LibreSSL.

 > A dependency is added to use the Buildroot host tool openssl to
 > create headers (dh512.h).  This resolves a host OS mismatch with
 > openssl versions. (The Makefile does this generation as part of
 > the initial build)

Thanks. I wasn't aware of the dhparam -C option.

Committed, thanks.

-- 
Bye, Peter Korsgaard
