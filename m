From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 22:05:30 +0200
Subject: [Buildroot] [PATCH 1/2] busybox: add fbset to default configs
In-Reply-To: <1401644248-27612-1-git-send-email-hadrien.boutteville@gmail.com>
 (Hadrien Boutteville's message of "Sun, 1 Jun 2014 19:37:27 +0200")
References: <1401644248-27612-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <87fvjnulf9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hadrien" == Hadrien Boutteville <hadrien.boutteville@gmail.com> writes:

 > Some drivers (like ti-gfx) need fbset and we can't select it when we
 > use BusyBox because it is provided by BusyBox and as a package.

 > Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
