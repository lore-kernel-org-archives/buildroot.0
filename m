From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 22:18:45 +0100
Subject: [Buildroot] [PATCH] lzlib: depends on lua
In-Reply-To: <20161221202244.7197-1-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Wed, 21 Dec 2016 17:22:44 -0300")
References: <20161221202244.7197-1-gustavo.zacarias@free-electrons.com>
Message-ID: <87mvfp2d6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > It's missing the dependency on lua, hence when using the upcoming PPS
 > support its staging directory isn't populated with the required
 > dependencies resulting in build failure.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
