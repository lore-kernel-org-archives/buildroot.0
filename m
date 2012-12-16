From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 11:54:46 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sat, 8 Dec 2012 16:53:08 +0100")
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
 <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87txrme07d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> This fix is needed for the 64bits build because Netatalk will assume the library
 Maxime> are stored in [..]/lib64/ instead of [..]/lib/

Committed, thanks.

-- 
Bye, Peter Korsgaard
