From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 23:29:28 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.7
In-Reply-To: <20180318144008.13997-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 18 Mar 2018 15:40:08 +0100")
References: <20180318144008.13997-1-peter@korsgaard.com>
Message-ID: <87vadtc913.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Use after free when server is disconnected during netsplits.  Incomplete fix
 > of CVE-2017-7191.  Found by Joseph Bisch.  (CWE-416, CWE-825) -
 > CVE-2018-7054 [2] was assigned to this issue.

 > Use after free when SASL messages are received in unexpected order.  Found
 > by Joseph Bisch.  (CWE-416, CWE-691) - CVE-2018-7053 [3] was assigned to
 > this issue.

 > Null pointer dereference when an ?empty? nick has been observed by Irssi.
 > Found by Joseph Bisch.  (CWE-476, CWE-475) - CVE-2018-7050 [4] was assigned
 > to this issue.

 > When the number of windows exceed the available space, Irssi would crash due
 > to Null pointer dereference.  Found by Joseph Bisch.  (CWE-690) -
 > CVE-2018-7052 [5] was assigned to this issue.

 > Certain nick names could result in out of bounds access when printing theme
 > strings.  Found by Oss-Fuzz.  (CWE-126) - CVE-2018-7051 [6] was assigned to
 > this issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
