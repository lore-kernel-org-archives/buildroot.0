From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Apr 2010 21:51:18 +0200
Subject: [Buildroot] [PATCH 03/21] udpcast: convert to the autotools
	infrastructure
In-Reply-To: <20100413165903.33f58597@surf> (Thomas Petazzoni's message of
	"Tue, 13 Apr 2010 16:59:03 +0200")
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<b7fe41a1f4c9fc78ea89fe332a7d98d2922ed83f.1271077873.git.thomas.petazzoni@free-electrons.com>
	<87d3y4k1dq.fsf@macbook.be.48ers.dk> <20100413165903.33f58597@surf>
Message-ID: <87hbnfi11l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Why are you now forcing 64bit here?

 Thomas> Good question. When I wrote the change, I remember thinking
 Thomas> about this, but I really don't remember why I did the change
 Thomas> this way. Definitely, we should be conservative and keep it as
 Thomas> it was.

Ok.

 >> Not a big deal, but you seem to forgot the final newline in several
 >> files - Is there any reason why?

 Thomas> Simply because in the text editor I'm using, having a final
 Thomas> newline or not does not make any visible difference, so I
 Thomas> always forget about this.

Ok.

 Thomas> I've pushed updated versions of the patches, to fix the udpcast large
 Thomas> file thing, and to add the newlines at the end of files. You can pull
 Thomas> from:

 Thomas>  git://git.busybox.net/~tpetazzoni/git/buildroot autotools-conversion

 Thomas> I'm not spamming again the list by resending everything, but if you
 Thomas> think it's worth, I'll do so.

No, it's fine - Pulled and pushed, thanks!

-- 
Bye, Peter Korsgaard
