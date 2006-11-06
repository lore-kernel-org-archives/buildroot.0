From: Ulf Samuelsson <ulfs@dof.se>
Date: Mon,  6 Nov 2006 22:29:31 +0200
Subject: [Buildroot] Suggestion, Keep version in a separate file.
Message-ID: <LS3rmy351Zd4.Fk5h2M9g@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I believe it would be a good
idea to separate the version
info and download site 
from the <package>.mk.
and keep a central file
with this info.

This would make it easier
to handle several projects
using different versions
of packages with the same
framework.
As part of this I think patches
to packages should reside
in a subdirectory to the
main package directory.

/Ulf
