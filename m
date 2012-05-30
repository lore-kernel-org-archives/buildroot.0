From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 May 2012 23:06:07 +0200
Subject: [Buildroot] merge windows, package submission standards,
	procedure ... ?
In-Reply-To: <CAPOFwxoH3mJX8-tY0KvBiiyeH19VODTz+xgRMz=8-oB7q=154Q@mail.gmail.com>
 (David Purdy's message of "Tue, 29 May 2012 16:51:01 -0500")
References: <CAPOFwxoH3mJX8-tY0KvBiiyeH19VODTz+xgRMz=8-oB7q=154Q@mail.gmail.com>
Message-ID: <87d35lxtts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Purdy <david.c.purdy@gmail.com> writes:

Hi,

 David> Hi all,
 David> As I'd not submitted a package/patch to Buildroot before a few days
 David> ago**, I'm asking if there is:

 David> 1.   a specific merge window/timeline that patches need to be in by in
 David> order to make it into a pending release?

Yes. We do releases every 3 months (I'll most likely release 2012.05
tonight). After a release has been done, the tree is open for new
features for the next 2 months, after which I put of release (n+1)-rc1,
and no longer add any new features to the main (release) branch. At the
same time I also create a next branch and start adding new feature
patches for the following release. Once the release is out I'll merge
next to the the main branch and the cycle restarts.

 David> 2.   anything more specific coding requirements than what is listed
 David> here? : http://buildroot.uclibc.org/buildroot.html#add_packages
 David> [ like checkpatch.pl conformity,  trial build for minimum number of
 David> targets/archs ]

Nothing really specific. The kernel/u-boot checkpatch is for C code, not
the typical makefile / build system fixes we have in buildroot.

The new asciidoc based manual (make manual-html or
http://buildroot.net/downloads/manual/manual.html has some more details
than the old buildroot.html).

 David> 3.  any one single person that I need to get contact (like a "new
 David> packages custodian)?
 David> [at U-Boot for instance they have "custodians" who manage certain
 David> aspects of the git tree]

Not really. Just post on the mailing list. I'm the maintainer so I will
be one committing the changes to the official tree, but several people
review patches besides me.

 David> 4.   a need to open a Bug Report for a new package?

No, please just post patches on the list.

-- 
Bye, Peter Korsgaard
