From: Sebastian Schuberth <sschuberth@gmail.com>
Date: Fri, 5 Feb 2010 17:18:13 +0100
Subject: [Buildroot] Adding a package with source code in-tree
Message-ID: <bdca99241002050818h3c7e5f5ewbe4596cfc9e1ae43@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'd like to add a package to buildroot with the source code residing
inside the buildroot tree itself, i.e. in a directory like
"package/my_package/source". So far, I've only seen examples of *.mk
files that download the tarred source code from some server. Can
anyone tell me whether it's possible to just build already extracted
files that are in the tree, and how such an *.mk file would look like?

Thanks.

-- 
Sebastian Schuberth
