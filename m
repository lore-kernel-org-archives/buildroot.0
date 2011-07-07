From: James Hanley <jhanley@dgtlrift.com>
Date: Thu, 7 Jul 2011 10:06:18 -0400
Subject: [Buildroot] Feature request - pull sources from repose
Message-ID: <5725744097739393062@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Right now, buildroot downloads sources from released tarball urls, it
would be great if they could also pull from source repositories (git,
svn, etc.) to get unreleased features. For example I ran into an issue
with uclibc which was fixed but not yet released.  It may also assist
in weeding out integration issues before package release.
