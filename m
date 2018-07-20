From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 09:31:40 +0200
Subject: [Buildroot] [PATCH] wireguard: bump to 0.0.20180708
In-Reply-To: <CAHmME9oSbkS8OqwzWjC7s2DV0dYDXs1611CWe+p2Ocwvc59hpg@mail.gmail.com>
 (Jason A. Donenfeld's message of "Fri, 20 Jul 2018 02:23:52 +0200")
References: <20180710193554.4394-1-Jason@zx2c4.com>
 <87wotray9d.fsf@dell.be.48ers.dk>
 <CAHmME9pCuQBH2QNQaR-VGOviDrZH01vsOj90buj2L0Lt7rBm4w@mail.gmail.com>
 <87sh4ec3x1.fsf@dell.be.48ers.dk> <87d0vianls.fsf@dell.be.48ers.dk>
 <CAHmME9oSbkS8OqwzWjC7s2DV0dYDXs1611CWe+p2Ocwvc59hpg@mail.gmail.com>
Message-ID: <87zhym8isj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > Yes I am, but if you really need I can re push them. Is there a good
 > reason you're still building old code?

Well, for released Buildroot versions it is, E.G. 2018.02 was released
with 0.0.20180218 (updated to 0.0.20180420 in 2018.02.2 and will now be
updated to 0.0.20180708 in the upcoming 2018.02.4). We normally do not
bump the package versions in the LTS release unless important/security
issues are found.

I understand that you prefer people use the latest version, but that is
not always possible. Just keeping the old tags around like other
projects seems the easiest solution to me.

We normally archive a copy of the tarball on sources.buildroot.net which
is used as a fallback location, but that failed here as I only cherry
picked the bump to 20180613 to the LTS version AFTER you removed the
tag, and we have reworked the download logic after 2018.02 was released
(so the tarballs are now under sources.buildroot.net/wireguard for
master).

-- 
Bye, Peter Korsgaard
