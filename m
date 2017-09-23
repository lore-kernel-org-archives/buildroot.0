From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Sep 2017 23:10:59 +0200
Subject: [Buildroot] [PATCH-2017.02.x] tor: security bump to version
	0.2.9.12
In-Reply-To: <20170923092336.13960-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 23 Sep 2017 11:23:36 +0200")
References: <20170923092336.13960-1-peter@korsgaard.com>
Message-ID: <874lrtm87w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-0380: Stack disclosure in hidden services logs when
 > SafeLogging disabled

 > For more details, see:
 > https://trac.torproject.org/projects/tor/ticket/23490

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
