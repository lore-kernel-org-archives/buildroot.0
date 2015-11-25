From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:01:34 +0100
Subject: [Buildroot] [PATCH] c-ares: define random file
In-Reply-To: <1448455453-22572-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Wed, 25 Nov 2015 09:44:13 -0300")
References: <1448455453-22572-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87r3jdyc01.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > When cross-compiling it assumes there's none, however that's not true.
 > Specify the usual /dev/urandom for this usage, it's used for random key
 > generation on startup.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
