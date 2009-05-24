From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 May 2009 09:21:25 +0200
Subject: [Buildroot] hang generating DSA keys
In-Reply-To: <20090522142624.2FEF618005F@silver.osuosl.org> (Chris Bare's
	message of "Fri\, 22 May 2009 10\:25\:53 -0400 \(EDT\)")
References: <20090522142624.2FEF618005F@silver.osuosl.org>
Message-ID: <87r5yfezka.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Bare <chris@bareflix.com> writes:

 Chris> Generating DSA Key...
 Chris> THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

 Chris> Generating public/private dsa key pair.

 Chris> I let it sit overnight and it never finished. I remember
 Chris> seeing some mention of this being an entropy problem. I tried
 Chris> pinging the board, but that didn't seem to help.

 Chris> Any idea why this would suddenly start with the same basic
 Chris> setup that worked before?  How do I get it to finish
 Chris> generating the key?

Sounds odd - Could you add strace and check what it's busy doing?

-- 
Bye, Peter Korsgaard
