From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Apr 2012 10:01:49 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.1
In-Reply-To: <20120426095919.0f163bac@skate> (Thomas Petazzoni's message of
 "Thu, 26 Apr 2012 09:59:19 +0200")
References: <1334517476-15258-1-git-send-email-s.martin49@gmail.com>
 <874ns7ar7b.fsf@macbook.be.48ers.dk> <20120426095919.0f163bac@skate>
Message-ID: <87zk9yaple.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> You need gcc >= 4.4 to build lttng components. I guess you're
 Thomas> using gcc 4.3 here, no?

Ahh yes, this was indeed a prebuilt 4.3 buildroot toolchain - I'll give
our default toolchain a try as well.

-- 
Bye, Peter Korsgaard
