From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 07:30:14 +0100
Subject: [Buildroot] [PATCH] tor: security bump to 0.2.8.12
In-Reply-To: <20161221060033.6cy57n7by6aovfk5@tarshish> (Baruch Siach's
 message of "Wed, 21 Dec 2016 08:00:33 +0200")
References: <20161220130237.20552-1-peter@korsgaard.com>
 <87a8bq73hd.fsf@dell.be.48ers.dk>
 <20161221060033.6cy57n7by6aovfk5@tarshish>
Message-ID: <87k2at6bgp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Tue, Dec 20, 2016 at 09:25:02PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> 
 >> > Fixes CVE-2016-1254 - One byte past an allocated buffer read while parsing
 >> > hidden service descriptors:
 >> 
 >> > https://blog.torproject.org/blog/tor-02812-released
 >> 
 >> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> 
 >> Committed, thanks.

 > This commit is not in master as of 325f79bb033 (busybox: adjust nommu 
 > swaponoff handling for busybox 1.26.0+).

You are right - Thanks. I've added it now.

-- 
Bye, Peter Korsgaard
