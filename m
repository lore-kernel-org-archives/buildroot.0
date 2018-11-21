From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Nov 2018 07:15:32 +0100
Subject: [Buildroot] [PATCH 2/6 v2] fs/tar: add support for xattrs (thus
 capabilties)
In-Reply-To: <0b788d4ef7c7f0d02c1a15b31a69d08de3401abe.1542043922.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 12 Nov 2018 18:33:12 +0100")
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <0b788d4ef7c7f0d02c1a15b31a69d08de3401abe.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <87ftvvnegr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

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

Committed, thanks.

-- 
Bye, Peter Korsgaard
