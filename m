From: =?ISO-8859-1?Q?Ra=FAl_S=E1nchez?= Siles <rasasi78@gmail.com>
Date: Thu, 19 Sep 2013 23:58:55 +0200
Subject: [Buildroot] [PATCH v2 0/1] Allow svn tags and branches notation in
	$(PKG)_VERSION variable.
In-Reply-To: <87fvt0fwix.fsf@dell.be.48ers.dk>
References: <87fvt0fwix.fsf@dell.be.48ers.dk>
Message-ID: <2873382.jskDvbugG2@portaka>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

  Even that I understand Tom's answer as a NAK, I decided to send a revision 
of the previous patch, just for the record. In this version the last modified 
svn revision for the tag (or branch) is retrieved (and exactly that).

  Maybe someone can come with better and acceptable ideas from the buildroot 
point of view.

  I still consider the key point is being able to encode the revision into the 
$(PKG)_SOURCE variable.

  Regards,

Ra?l S?nchez Siles (1):
  Allow svn tags and branches notation in $(PKG)_VERSION variable.

 docs/manual/adding-packages-generic.txt | 2 ++
 package/pkg-download.mk                 | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.4.rc3
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/05db55a5/attachment.asc>
