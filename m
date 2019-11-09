From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 18:14:52 +0100
Subject: [Buildroot] [PATCH] package/libfribidi: add upstream security
 fix
In-Reply-To: <20191108160030.12803-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 8 Nov 2019 17:00:29 +0100")
References: <20191108160030.12803-1-peter@korsgaard.com>
Message-ID: <87lfspkm43.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2019-18397: GNU FriBidi stack buffer overflow >= 1.0.0

 > For more details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2019/11/08/5

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.08.x (2019.02.x uses < 1.0.0), thanks.

-- 
Bye, Peter Korsgaard
