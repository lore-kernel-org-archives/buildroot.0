From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Apr 2012 21:55:57 +0200
Subject: [Buildroot] [PATCH 01/22] Remove the DATE variable
In-Reply-To: <20120422173226.590ca81a@skate> (Thomas Petazzoni's message of
 "Sun, 22 Apr 2012 17:32:26 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <3a993084fda775e7a2c37371225c124fd620a244.1334673910.git.thomas.petazzoni@free-electrons.com>
 <201204211505.51141.arnout@mind.be>
 <871ungi39o.fsf@macbook.be.48ers.dk> <20120422173226.590ca81a@skate>
Message-ID: <87wr57h776.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Well, it's just that I don't very much like to have unused
 Thomas> variables here and there. One way to make it useful is for
 Thomas> example to store the build date into some file in the target
 Thomas> filesystem.

True. We could perhaps add it to /etc/os-release?

http://www.freedesktop.org/software/systemd/man/os-release.html

-- 
Bye, Peter Korsgaard
