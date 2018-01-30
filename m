From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:49:46 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.2-P1
In-Reply-To: <20180117074243.31352-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 17 Jan 2018 08:42:43 +0100")
References: <20180117074243.31352-1-peter@korsgaard.com>
Message-ID: <87k1vz9d2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2017-3145: Improper sequencing during cleanup can lead to a
 > use-after-free error, triggering an assertion failure and crash in
 > named.

 > For more details, see the advisory:
 > https://lists.isc.org/pipermail/bind-announce/2018-January/001072.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
