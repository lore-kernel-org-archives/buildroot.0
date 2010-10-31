From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Oct 2010 21:35:21 +0100
Subject: [Buildroot] [PATCH v2] libgtk2: Fix pixbuf loaders cache file
	generation
In-Reply-To: <20101030172912.29024.35348.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Sat, 30 Oct 2010 20:29:12 +0300")
References: <20101030172912.29024.35348.stgit@localhost.localdomain>
Message-ID: <87y69eaynq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> After libgtk was bumped to 2.22.0 default loacation of
 Paulius> pixbuf loaders cache changed.
 Paulius> Use --update-cache flag for gdk-pixbuf-query-loaders
 Paulius> which does waht we need.

Committed, thanks!

We should propbably rename / move this initscript to gdk-pixbuf instead
though.

-- 
Bye, Peter Korsgaard
