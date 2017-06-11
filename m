From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jun 2017 22:45:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.0.8
In-Reply-To: <20170610083053.20683-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 10 Jun 2017 10:30:53 +0200")
References: <20170610083053.20683-1-bernd.kuhls@t-online.de>
Message-ID: <87k24i8d9e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

It would have been good to mention that this is a security fix. From the
release notes:

https://blog.torproject.org/blog/tor-0308-released-fix-hidden-services-also-are-02429-02514-02612-0278-02814-and-02911

I see it fixes CVE-2017-0375 and CVE-2017-0376.

I'll send a fix for the 2.9.x series for 2017.02.x and 2017.05.x.

-- 
Bye, Peter Korsgaard
