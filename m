From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Sep 2015 11:09:05 +0200
Subject: [Buildroot] [PATCH 1/6] python-urwid: bump version and add
	checksums
In-Reply-To: <20150916090029.GJ11632@tarshish> (Baruch Siach's message of
 "Wed, 16 Sep 2015 12:00:29 +0300")
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
 <20150901100816.GM17874@tarshish> <87oah6avor.fsf@dell.be.48ers.dk>
 <20150916090029.GJ11632@tarshish>
Message-ID: <87twquu3wu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Yeah, the upstream pypi hash URLs are kind of odd. These are the
 >> official links though.

 > The .hash file is all about trust, IMO. Seeing md5 that is an identity 
 > function of the URL just makes me feel uneasy. The package URL at 
 > https://pypi.python.org/pypi/urwid/1.3.0 contains the same link (next to the 
 > file name), but it looks less easy to trick.

Yes, I agree. As long as we have a stronger hash locally computed it
isn't a big deal, but it would be good if the pypi guys could do
something more sensible. I'm not sure who to contact about that though.

-- 
Venlig hilsen,
Peter Korsgaard 
