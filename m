From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:55:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: security bump
	version to 5.47
In-Reply-To: <20170916084117.11155-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 16 Sep 2017 10:41:17 +0200")
References: <20170916084117.11155-1-bernd.kuhls@t-online.de>
Message-ID: <871sm2sqoo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46 and
 > earlier are vulnerable to an information disclosure vulnerability which
 > allows remote attackers to obtain sensitive information from the bluetoothd
 > process memory.  This vulnerability lies in the processing of SDP search
 > attribute requests.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
