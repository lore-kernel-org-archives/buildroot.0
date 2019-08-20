From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 13:21:22 +0200
Subject: [Buildroot] [PATCH] package/musl: add upstream security fixes
 for CVE-2019-14697
In-Reply-To: <20190820082134.11583-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 20 Aug 2019 10:21:33 +0200")
References: <20190820082134.11583-1-peter@korsgaard.com>
Message-ID: <875zms9j65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-14697: musl libc 1.1.23 and earlier x87 float stack imbalance
 > For more details, see the oss-security discussion:
 > https://www.openwall.com/lists/oss-security/2019/08/05/6

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
