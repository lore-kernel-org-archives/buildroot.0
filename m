From: chalil jitesh <chaliljitesh@gmail.com>
Date: Wed, 30 Oct 2019 15:15:07 +0530
Subject: [Buildroot] Option to download a particular package source from
 <PACKAGE>_SITE instead of using the predownloaded source from DL_DIR
Message-ID: <CAP8JTaaKRrHBk3JeuOfVuGifH05L_V_iDj5NLahqtOaOLxhEDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is there an option in buildroot to always download a particular package
source <PACKAGE>_SOURCE from <PACKAGE>_SITE, instead of using the
predownloaded package source <PACKAGE>_SOURCE file present in DL_DIR
directory (only for a particular package).
Example if a package source name is "package-latest.tar.gz", during build
if the source file package-latest.tar.gz is already present in DL_DIR path
this source is taken for the build, the latest updated package source file
is not getting downloaded from <PACKAGE>_SITE. (Only for a particular
package i want this behavior and for other packages the package source
should be taken from DL_DIR directory which is configured)
Kindly please advice me if there any options in buildroot which i can use
to achieve this.

Thanks
Jitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191030/54e0f61f/attachment.html>
