From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 09:16:38 +0100
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.39
In-Reply-To: <20181112230241.8435-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 13 Nov 2018 00:02:41 +0100")
References: <20181112230241.8435-1-peter@korsgaard.com>
Message-ID: <87ftw54ck9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2018-12384: NSS responded to an SSLv2-compatible ClientHello with a
 > ServerHello that had an all-zero random.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
