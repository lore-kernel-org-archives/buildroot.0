From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:46:26 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.19.1
In-Reply-To: <20201222200029.2315-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 22 Dec 2020 21:00:28 +0100")
References: <20201222200029.2315-1-peter@korsgaard.com>
Message-ID: <87r1nfegm5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-8277: Denial of Service through DNS request (High).  A Node.js
 >   application that allows an attacker to trigger a DNS request for a host of
 >   their choice could trigger a Denial of Service by getting the application
 >   to resolve a DNS record with a larger number of responses.

 > https://nodejs.org/en/blog/release/v12.19.1/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
