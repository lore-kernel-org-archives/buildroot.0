From: Patrick Boettcher <pboettcher@kernellabs.com>
Date: Fri, 29 Mar 2013 15:07:57 +0100
Subject: [Buildroot] [PATCH] pkg-download with git and not VERSION set in
	package
Message-ID: <1364566078-29535-1-git-send-email-Patrick.Boettcher@parrot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm new to buildroot and was playing with a local git-tree. I noticed
that things weren't working when VERSION is not set in the package.

The following patch is trivial but solves the problem with the current
implemenation.

Please copy me on replies as I'm not yet subscribed.

Patrick Boettcher (1):
  pkg-download: take some more care of <PKG_>VERSION when METHOD is git

 package/pkg-download.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
1.7.10.4
