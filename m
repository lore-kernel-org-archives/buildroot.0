From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 21:25:02 +0100
Subject: [Buildroot] [PATCH] tor: security bump to 0.2.8.12
In-Reply-To: <20161220130237.20552-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 20 Dec 2016 14:02:37 +0100")
References: <20161220130237.20552-1-peter@korsgaard.com>
Message-ID: <87a8bq73hd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2016-1254 - One byte past an allocated buffer read while parsing
 > hidden service descriptors:

 > https://blog.torproject.org/blog/tor-02812-released

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
