From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:35:43 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: decode
 subprocess output for python3
In-Reply-To: <20200301211848.13659-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Sun, 1 Mar 2020 22:18:48 +0100")
References: <20200301211848.13659-1-titouan.christophe@railnova.eu>
Message-ID: <87r1yacrls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > In Python 3, the functions from the subprocess module return bytes
 > (and no longer strings as in Python 2), which must be decoded for
 > further text operations.

 > Now, pkg-stats can be run in Python 3.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
