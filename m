From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 May 2012 16:34:33 +0200
Subject: [Buildroot] [PATCH 2/2] sam-ba: only propose it if the host is
	x86 or x86_64
In-Reply-To: <20120507134551.GB10138@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Mon, 7 May 2012 15:45:51 +0200")
References: <1334675140-20303-1-git-send-email-plagnioj@jcrosoft.com>
 <1334675140-20303-2-git-send-email-plagnioj@jcrosoft.com>
 <20120423065000.GL20601@game.jcrosoft.org>
 <20120427101956.GA2992@game.jcrosoft.org>
 <20120504050148.GD20123@game.jcrosoft.org>
 <20120507134551.GB10138@game.jcrosoft.org>
Message-ID: <87d36gcb5y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> it's the for ping

 Jean-Christophe> did I need to understand that noe one care of non x86 host?

To me it is more of a question of tradeoffs. Either we do it really
right and use this kind of infrastructure for the external toolchains as
well (where it really matters), or we decide the extra complexity isn't
worth it for the few non-x86 users.

I haven't made up my mind about this yet, but am leaning towards the
2nd.

-- 
Bye, Peter Korsgaard
