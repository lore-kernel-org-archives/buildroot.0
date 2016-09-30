From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 11:34:58 +0200
Subject: [Buildroot] [PATCH] uclibc: fix compile if locales are enabled
In-Reply-To: <20160929104355.GA24031@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 29 Sep 2016 12:43:55 +0200")
References: <20160929104355.GA24031@waldemar-brodkorb.de>
Message-ID: <87r381yblp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Reported via #buildroot, the newly activated locale
 > tool should only build for the target, not for the host.

 > Fix from upstream.

 > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
