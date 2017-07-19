From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:51:04 +0200
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.4
In-Reply-To: <20170708143433.29253-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 8 Jul 2017 16:34:33 +0200")
References: <20170708143433.29253-1-peter@korsgaard.com>
Message-ID: <87inioa62f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the advisory:
 > https://irssi.org/security/irssi_sa_2017_07.txt

 > Two vulnerabilities have been located in Irssi.

 > (a) When receiving messages with invalid time stamps, Irssi would try
 >     to dereference a NULL pointer. Found by Brian 'geeknik' Carpenter
 >     of Geeknik Labs. (CWE-690)

 >     CVE-2017-10965 [2] was assigned to this bug

 > (b) While updating the internal nick list, Irssi may incorrectly use
 >     the GHashTable interface and free the nick while updating it. This
 >     will then result in use-after-free conditions on each access of
 >     the hash table. Found by Brian 'geeknik' Carpenter of Geeknik
 >     Labs. (CWE-416 caused by CWE-227)

 >     CVE-2017-10966 [3] was assigned to this bug

 > Impact
 > ------

 > (a) May result in denial of service (remote crash).

 > (b) Undefined behaviour.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
