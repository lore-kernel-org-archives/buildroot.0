From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Oct 2011 15:43:21 +0200
Subject: [Buildroot] [PATCH 1/4] Cleanup cramfs package declaration.
In-Reply-To: <9f42073e93b2c83d2d4a0176321884aa61bd9ca9.1315577080.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 9 Sep 2011 16:05:07 +0200")
References: <cover.1315577080.git.maxime.ripard@free-electrons.com>
 <cover.1315577080.git.maxime.ripard@free-electrons.com>
 <9f42073e93b2c83d2d4a0176321884aa61bd9ca9.1315577080.git.maxime.ripard@free-electrons.com>
Message-ID: <878vo6turq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Cramfs still passes the device table to mkcramfs, which is irrelevant
 Maxime> now with fakeroot, remove this behaviour and the associated patch.

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
