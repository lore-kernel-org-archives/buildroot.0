From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:33:55 +0200
Subject: [Buildroot] [1/1] fs/cpio: sort 'find' utility output
 (reproducible builds)
In-Reply-To: <20200629153701.7c2c5ca4@monakov-y.xu> (Yurii Monakov's message
 of "Mon, 29 Jun 2020 15:37:01 +0300")
References: <20200629153701.7c2c5ca4@monakov-y.xu>
Message-ID: <87k0z3s9l8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yurii" == Yurii Monakov <monakov.y@gmail.com> writes:

 > Order of find utility results are not sorted and depend on items
 > attributes, so cpio produces different results across machines.

 > This patch sorts find output before piping to cpio to make
 > builds reproducible.

 > Signed-off-by: Yurii Monakov <monakov.y@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
