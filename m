From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:52:08 +0100
Subject: [Buildroot] [PATCH] linux-firmware: Install all Qlogic QED
 binaries
In-Reply-To: <20181213231532.9657-1-joel@jms.id.au> (Joel Stanley's message of
 "Fri, 14 Dec 2018 09:45:32 +1030")
References: <20181213231532.9657-1-joel@jms.id.au>
Message-ID: <87va3t3zsn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > There are various versions shipped in linux-firmware. In the past we
 > decided that it was up to the developer to filter out the ones they want
 > for their specific kernel version, so install them all.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
