From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:42:28 +0100
Subject: [Buildroot] [PATCH] package/python-lxml: security bump to
 version 4.6.2
In-Reply-To: <20201213230152.5819-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 14 Dec 2020 00:01:52 +0100")
References: <20201213230152.5819-1-peter@korsgaard.com>
Message-ID: <877dpbp96j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > * 4.6.2: A vulnerability (CVE-2020-27783) was discovered in the HTML Cleaner
 >   by Yaniv Nizry, which allowed JavaScript to pass through.  The cleaner now
 >   removes more sneaky "style" content.

 > * 4.6.1: A vulnerability was discovered in the HTML Cleaner by Yaniv Nizry,
 >   which allowed JavaScript to pass through.  The cleaner now removes more
 >   sneaky "style" content.

 > For more details, see the changes file:
 > https://github.com/lxml/lxml/blob/lxml-4.6.2/CHANGES.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
