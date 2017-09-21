From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 16:59:51 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: add upstream security fix for
	CVE-2017-1000250
In-Reply-To: <20170913121955.21236-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Sep 2017 14:19:55 +0200")
References: <20170913121955.21236-1-peter@korsgaard.com>
Message-ID: <8760ccumfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46 and
 > earlier are vulnerable to an information disclosure vulnerability which
 > allows remote attackers to obtain sensitive information from the bluetoothd
 > process memory.  This vulnerability lies in the processing of SDP search
 > attribute requests.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks (seems safer than bumping to 5.47).

-- 
Bye, Peter Korsgaard
