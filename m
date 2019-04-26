From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:06:01 +0200
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 1.24.2
In-Reply-To: <20190425070722.19438-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 25 Apr 2019 09:07:22 +0200")
References: <20190425070722.19438-1-peter@korsgaard.com>
Message-ID: <87r29ox6fa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2019-11324: The urllib3 library before 1.24.2 for Python mishandles
 >   certain cases where the desired set of CA certificates is different from
 >   the OS store of CA certificates, which results in SSL connections
 >   succeeding in situations where a verification failure is the correct
 >   outcome.  This is related to use of the ssl_context, ca_certs, or
 >   ca_certs_dir argument.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
