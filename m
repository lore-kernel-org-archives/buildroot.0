From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Sep 2019 22:56:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.10.8
In-Reply-To: <20190904175848.25240-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 4 Sep 2019 19:58:48 +0200")
References: <20190904175848.25240-1-bernd.kuhls@t-online.de>
Message-ID: <87d0gf93wa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: https://www.samba.org/samba/history/samba-4.10.8.html
 > Fixes CVE-2019-10197
 >  Combination of parameters and permissions can allow user
 >  to escape from the share path definition.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2019.08.x, thanks.

For 2019.02.x and 2019.05.x I will instead bump to 4.9.13, which fixes
the same issue.

-- 
Bye, Peter Korsgaard
