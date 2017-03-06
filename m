From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 7 Mar 2017 00:28:46 +0100
Subject: [Buildroot] Download tag as archive from gitlab
Message-ID: <CA+TH9Vmhs+bLmoo5UvD5VWAPahsDnseJ-eeEcBQJrwDHDKUQrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

I'm hitting some bumps trying to download a tag from gitlab as an
archive, the url format is like this:

https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.bz2?ref=v6.9.2

I can succesfully download the file, but then it's named
"archive.tar.bz2?ref=v6.9.2" but it cannot be extracted cause it lacks
an extensions and buildroot cannot choose the right helper to
decompress it.

How such an url can be downloaded in buildroot?

Thanks!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
