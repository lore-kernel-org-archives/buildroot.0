From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jan 2019 20:58:05 +0100
Subject: [Buildroot] [PATCH 1/1] strace: bump to version 4.26
In-Reply-To: <20190104154627.9472-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Fri, 4 Jan 2019 16:46:27 +0100")
References: <20190104154627.9472-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87wonhftiq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > The licence changed from BSD to LGPL 2.1 or later, update this
 > accordingly.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > ---
 >  package/strace/strace.hash | 7 ++++---
 >  package/strace/strace.mk   | 6 +++---
 >  2 files changed, 7 insertions(+), 6 deletions(-)

 > runtime-tested on an arm with uclibc.

 > diff --git a/package/strace/strace.hash b/package/strace/strace.hash
 > index f7d652faaa..fe58f2391a 100644

Committed, thanks.

-- 
Bye, Peter Korsgaard
