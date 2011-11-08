From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Nov 2011 23:49:17 +0100
Subject: [Buildroot] [PATCH 1/2] util-linux: fix partx build breakage
In-Reply-To: <1318953196-19037-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 18 Oct 2011 12:53:15 -0300")
References: <1318953196-19037-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vcquut5e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> addpart, delpart and partx are enabled by default so --disable now to
 Gustavo> avoid build breaking when we lack libblkid.
 Gustavo> Also select libblkid when it's enabled now.

Committed, thanks.

-- 
Bye, Peter Korsgaard
