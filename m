From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 16:09:39 +0100
Subject: [Buildroot] DirectFB fetch problem (no tarball on the primary
	mirror)
In-Reply-To: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com> (Ihar
	Hrachyshka's message of "Wed\, 21 Jan 2009 16\:57\:27 +0200")
References: <fce2a370901210657q3f62fe85r642d9171b328876@mail.gmail.com>
Message-ID: <87ab9ksnkc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ihar" == Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:

 Ihar> Hello guys!
 Ihar> I have a problem building the image with DirectFB because it can't
 Ihar> fetch the source tarball from the mirror (no such file there). It
 Ihar> seems that DirectFB was updated by upstream from 1.2.6 to 1.2.7 and
 Ihar> then upstream developers removed the source tarball for previous
 Ihar> version from their repo. I think we should update the DirectFB version
 Ihar> to 1.2.7 because it's basically a bug fix release.

Thanks. Your build should still work with 1.2.6 as the tarball is on
the backup mirror, doesn't that work for you?

I'll bump the directfb version after the release.

-- 
Bye, Peter Korsgaard
