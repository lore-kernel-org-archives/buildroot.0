From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:25:10 +0100
Subject: [Buildroot] [git commit] fs/tar: add support for xattrs (thus
 capabilties)
In-Reply-To: <20181121061300.DAE3A83DEA@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 20 Nov 2018 23:28:07 +0100")
References: <20181121061300.DAE3A83DEA@busybox.osuosl.org>
Message-ID: <87k1kzx0ux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6d688e2132f9feb63e325c2456d23edfc53f79a8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > By default, tar will not include any extended attribute (xattr) when
 > creating archives, and thus will not store capabilties either (as they
 > are stored in the xattr 'security.capability').

 > Using option --xattrs is enough to create a tarball with all the xattrs
 > attached to a file. However, extracting all xattrs from a tarball
 > requires that --xattrs-include='*' be used. This is not symetric (but on
 > purpose, as per the documentation), and so is confusing to some.

 > So, we use --xattrs-include='*' to create the archive, so as to be
 > explicit that we want all xattrs to be stored.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
