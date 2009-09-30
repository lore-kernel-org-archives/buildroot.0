From: Igor Serebryany <igor47@moomers.org>
Date: Wed, 30 Sep 2009 01:26:58 -0500
Subject: [Buildroot] multiple architectures
Message-ID: <20090930062658.GG25852@moomers.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

	I need both an x86 and an amd64 version of my buildroot filesystem
	and kernel. I've been making this happen by a very inefficient
	process - keeping two copies of the buildroot source (one for each
	arch), making local/projectname an svn working copy, making all
	changes to the x86 version and using 'svn update' to merge changes
	back into the amd64 version.

	I'm sure there must be a better way. How do people on here manage
	maintaining identical builds for multiple architectures? 

--Igor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090930/58eede28/attachment.pgp>
