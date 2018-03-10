From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 08:26:40 +0100
Subject: [Buildroot] [PATCH 03/10] package: add
 python-backports-ssl-match-hostname
In-Reply-To: <20180309191701.23760-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Mar 2018 20:16:54 +0100")
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-4-peter@korsgaard.com>
Message-ID: <871sgsfl1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The ssl.match_hostname() function from Python 3.5.
 > This function IS available in python 2.7 since 2.7.9, but it doesn't support
 > matching on IP addresses which is needed for some use cases.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
