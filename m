From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:06:49 +0200
Subject: [Buildroot] [PATCH] package/xen: add upstream security fix for
 XSA-327
In-Reply-To: <20200823203236.6175-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 23 Aug 2020 22:32:36 +0200")
References: <20200823203236.6175-1-peter@korsgaard.com>
Message-ID: <87r1rqpumu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2020-15564: Missing alignment check in VCPUOP_register_vcpu_info

 > For further details, see the advisory:

 > https://xenbits.xenproject.org/xsa/advisory-327.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
