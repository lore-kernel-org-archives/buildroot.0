From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 14:33:11 +0200
Subject: [Buildroot] [PATCHv3 04/20] toolchain: introduce a virtual
	package
In-Reply-To: <20131009134918.2e9e7844@skate> (Thomas Petazzoni's message of
 "Wed, 9 Oct 2013 13:49:18 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87ob6y4t8v.fsf@dell.be.48ers.dk> <20131009134918.2e9e7844@skate>
Message-ID: <87eh7u4oag.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Did you mean to simply do 'include toolchain/*.mk' instead of those
 >> two lines?

 Thomas> No. The toolchain/toolchain-{buildroot,external}.mk file get
 Thomas> removed in PATCH 5 and PATCH 6 respectively. So the problem is
 Thomas> just a bisection problem: I haven't tested the series after
 Thomas> each commit.

Tsk tsk ;)

 Thomas> Do you want me to respin with this bisection issue fixed?

No, lets just leave it as it is - Thanks.

-- 
Bye, Peter Korsgaard
