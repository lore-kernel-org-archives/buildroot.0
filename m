From: Michael Walle <michael@walle.cc>
Date: Thu, 20 Oct 2016 19:27:19 +0200
Subject: [Buildroot] cached downloads for scm branches
Message-ID: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

If I have a package which downloads it's source from a SCM branch, the 
download will be cached in DL_DIR/<pkgname>-<branchname>.tar.gz. This 
makes sense if the version is a tag or a (git) hash. But if used with 
branches, the package will never be downloaded again until I remove it 
from the DL_DIR. This may be the intended behaviour, but as far as I can 
tell, I have no chance to change it.

Do I miss something? Does it make sense to add a new package variable to 
force a download?

-michael
