From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Jan 2018 22:54:06 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.6
In-Reply-To: <20180107210318.15006-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 7 Jan 2018 22:03:18 +0100")
References: <20180107210318.15006-1-peter@korsgaard.com>
Message-ID: <87608cnhj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the advisory (https://irssi.org/security/irssi_sa_2018_01.txt):
 > Multiple vulnerabilities have been located in Irssi.

 > (a) When the channel topic is set without specifying a sender, Irssi
 >     may dereference NULL pointer. Found by Joseph Bisch. (CWE-476)

 >     CVE-2018-5206 was assigned to this issue.

 > (b) When using incomplete escape codes, Irssi may access data beyond
 >     the end of the string. (CWE-126) Found by Joseph Bisch.

 >     CVE-2018-5205 was assigned to this issue.

 > (c) A calculation error in the completion code could cause a heap
 >     buffer overflow when completing certain strings. (CWE-126) Found
 >     by Joseph Bisch.

 >     CVE-2018-5208 was assigned to this issue.

 > (d) When using an incomplete variable argument, Irssi may access data
 >     beyond the end of the string. (CWE-126) Found by Joseph Bisch.

 >     CVE-2018-5207 was assigned to this issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
