From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 May 2012 11:35:08 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
	helper functions
In-Reply-To: <CAAXf6LVpk6NEbnC9pBono-H9wXj9OBdEhttD2N-s5mbPHJs_7A@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 9 May 2012 10:06:20
 +0200")
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate>
 <CAAXf6LVpk6NEbnC9pBono-H9wXj9OBdEhttD2N-s5mbPHJs_7A@mail.gmail.com>
Message-ID: <87txzpwvcj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> Thanks for working on this and making a proposal.
 >> 
 >> However, on my side, I am not yet convinced that this is actually
 >> making things better than what we have now. What we have now is quite
 >> obvious for the first-time reader, which is very good. Those
 >> CONF_PKG_ENABLE and CONF_ENABLE macros make things a bit too cryptic
 >> from my point of view. This is not an absolutely strong opinion, but I
 >> have the feeling this is on the "we want to make things smaller/shorter
 >> and end up making things cryptic" side of the trade-off. Of course,
 >> others have to comment to share their views on this.

 Thomas> I tend to agree with Thomas that it makes things less obvious
 Thomas> for regular users. The relation between such a CONF_PKG_ENABLE
 Thomas> statement and the corresponding options passed to the configure
 Thomas> script is not apparent, which confuses people.

I must say I agree.

-- 
Bye, Peter Korsgaard
