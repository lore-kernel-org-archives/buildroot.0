From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Dec 2009 12:32:45 +0100
Subject: [Buildroot] [PATCH] mtd-utils: bump version number
In-Reply-To: <20091214104935.GA28375@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon, 14 Dec 2009 18:49:35 +0800")
References: <1260575109-7459-1-git-send-email-daniel@caiaq.de>
	<1260575725-7764-1-git-send-email-daniel@caiaq.de>
	<87ljh5sx5r.fsf@macbook.be.48ers.dk>
	<20091214104935.GA28375@buzzloop.caiaq.de>
Message-ID: <87hbrtssde.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 Daniel> Ok, the master branch moved forward and I recognized that too late,
 Daniel> hence the two patches.

Ok.

 >> It would be nice if the shortname could be computed from MTD_VERSION so
 >> things don't break when someone goes and changes the git id. GNU make
 >> unfortunately doesn't have a substring function, so the easiest solution
 >> is probably cut, E.G.:

 Daniel> I though about that too, but I wasn't sure whether the substring of the
 Daniel> SHA1 ID would always be 7 characters long. I fear that is choses to be
 Daniel> as short as possible but as long as necessary to be unique. Which would
 Daniel> then mean that it changes again at an aribitrary point.

Currently it is (gitweb calls git rev-parse --short-7), but I get your
point. This gitweb change is also very recent (since 1.6.6-rc1, released
December 2nd). I'll add a comment about it.

 Daniel> Best thing woulod be if the mtd people would just tag a commit with a
 Daniel> new release number. I'll write them and see if I can make them do that
 Daniel> :)

Yes, please - It has been 17 months since the last release, so it's
about time.

-- 
Bye, Peter Korsgaard
