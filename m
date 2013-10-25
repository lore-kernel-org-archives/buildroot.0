From: Peter Sanford <psanford@nearbuysystems.com>
Date: Fri, 25 Oct 2013 16:50:11 -0700
Subject: [Buildroot] Updating /etc/protocols
Message-ID: <CANGB_5aEjRq1=5mwPdJ8R9Q20aRdZ2JGpy2giGvz9QhMUoAfdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Today I noticed that /etc/protocols found in skeleton is quite old (2004)
and has a number of common protocols missing from it. It looks like the
current /etc/protocols was pulled from netbsd. Does it make sense to update
it based on the current netbsd file[1]?

-Peter

[1]
http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/etc/protocols?content-type=text/plain&only_with_tag=MAIN
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131025/7cd90451/attachment.html>
