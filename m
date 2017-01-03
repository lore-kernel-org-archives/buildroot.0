From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Jan 2017 16:24:59 +0100
Subject: [Buildroot] [PATCH] musl: security bump to version 1.1.16
In-Reply-To: <20170102160204.26561-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Mon, 2 Jan 2017 13:02:04 -0300")
References: <20170102160204.26561-1-gustavo@zacarias.com.ar>
Message-ID: <87tw9g414k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-8859 - fixes a serious under-allocation bug in regexec due to
 > integer overflow.

 > Drop upstream patch.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
