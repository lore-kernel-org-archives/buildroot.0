From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 08:52:50 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207232256.GD24430@vapier.lan> (Mike Frysinger's message of
 "Mon, 7 Dec 2015 18:22:56 -0500")
References: <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan> <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan> <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151207225408.GC24430@vapier.lan> <20151207230201.GG14874@free.fr>
 <20151207232256.GD24430@vapier.lan>
Message-ID: <876109nzql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 > and it doesn't address the other issue i raised: is buildroot going to
 > bootstrap wget and such to be sure SNI is supported ?  otherwise, even
 > if you get the buildroot source, sticking to http doesn't help when the
 > server transparently redirects you to https.  like getting busybox or
 > uclibc archives :).  or will buildroot detect wget is old and then use
 > --no-check-certificate everywhere ?

I don't believe we will ever bootstrap wget, but we might add
--no-check-certificates in the future (with the download hashes,
checking certificates doesn't add much).

-- 
Venlig hilsen,
Peter Korsgaard 
