From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:31:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 1.20.3
In-Reply-To: <20181025190124.29377-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 25 Oct 2018 21:01:24 +0200")
References: <20181025190124.29377-1-bernd.kuhls@t-online.de>
Message-ID: <875zx0zk2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2018-14665:
 > https://lists.x.org/archives/xorg-announce/2018-October/002927.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.08.x, thanks.

For 2018.02.x I am instead backporting the specific patch fixing this
vulnerability.

-- 
Bye, Peter Korsgaard
