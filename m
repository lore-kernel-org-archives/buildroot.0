From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 13:18:44 +0200
Subject: [Buildroot] [PATCH] supervisor: security bump to version 3.1.4
In-Reply-To: <20170907094459.10277-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 11:44:59 +0200")
References: <20170907094459.10277-1-peter@korsgaard.com>
Message-ID: <874lrwwb8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-11610 - The XML-RPC server in supervisor before 3.0.1, 3.1.x
 > before 3.1.4, 3.2.x before 3.2.4, and 3.3.x before 3.3.3 allows remote
 > authenticated users to execute arbitrary commands via a crafted XML-RPC
 > request, related to nested supervisord namespace lookups.

 > For more details, see
 > https://github.com/Supervisor/supervisor/issues/964

 > While we're at it, add hashes for the license files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
