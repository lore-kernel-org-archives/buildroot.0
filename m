From: g4 at novadsp.com <g4@novadsp.com>
Date: Thu, 24 Mar 2016 14:59:35 -0000
Subject: [Buildroot] Bootchart: Submit a patch questions ...
Message-ID: <003001d185dd$c7fa6ec0$57ef4c40$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been using bootchart just to experiment with getting stuff into the
buildroot framework. Is there any interest in a patch to add bootchart as an
option?

 

If so I've got a couple of questions:

 

1. For a new package is a single patchfile  acceptable? 

2. Does the makefile need to spell out licensing? (This seems to vary within
BR)?

3. Does the patch need to include the changes to package/config.in? I am
guessing yes .

4. Finally locally BR is configured to get its kernel sources and .config
from a local clone of /linux on github. In such a case can BR actually
correctly check the dependencies for bootchart? Presumably it does test
kernel config settings against the local .config stashed in build?

 

TAIA

 

Jerry.

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160324/1f77de59/attachment.html>
