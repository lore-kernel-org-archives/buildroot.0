From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:32:47 +0200
Subject: [Buildroot] [PATCH 1/1] support/testing: set $USER in rust tests
In-Reply-To: <20180428221413.1833-1-eric.le.bihan.dev@free.fr> (Eric Le
 Bihan's message of "Sun, 29 Apr 2018 00:14:13 +0200")
References: <20180428221413.1833-1-eric.le.bihan.dev@free.fr>
Message-ID: <87efivkezk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > When the run-time tests to build rust and rust-bin packages are run via Docker,
 > the $USER environment variable is not set, which makes cargo fail when
 > initializing the test project.

 > So add it to make cargo happy.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
