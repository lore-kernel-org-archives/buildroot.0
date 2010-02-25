From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Feb 2010 20:29:35 +0100
Subject: [Buildroot] Reduce rootfs size
In-Reply-To: <13abadeb1002250943r17888defs4976934b3718d5d9@mail.gmail.com>
	(Nuno Pereira's message of "Thu, 25 Feb 2010 17:43:27 +0000")
References: <13abadeb1002250943r17888defs4976934b3718d5d9@mail.gmail.com>
Message-ID: <87wry13yhs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:

 Nuno> Hi,
 Nuno> Is there a way of reduce rootfs size? My device doesn't have space for
 Nuno> the resulting rootfs done by buildroot (I'm so using a snapshot from
 Nuno> the beginning of the month)

Possible, but we'll need to know some more details - What is the maximum
size you have, your current config, what functionality do you need?

 Nuno> Alternatively, a way of reduce libstdc++ size?

Not easily. Depending on how many applications needs libstdc++ and how
much functionality from it you need, it might be smaller to link
statically against it.

-- 
Bye, Peter Korsgaard
