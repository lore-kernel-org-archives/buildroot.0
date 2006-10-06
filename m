From: Will Newton <will.newton@gmail.com>
Date: Fri, 6 Oct 2006 17:05:49 +0100
Subject: [Buildroot] gettext fixes
Message-ID: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building gettext with the latest buildroot fails. I've attached a
patch that fixes a couple of issues for me.

1. am_cv_func_working_getline should be defined or the build fails
with undefined "gnu_getline".
2. The libintl binary has moved.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gettext.patch
Type: application/octet-stream
Size: 932 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061006/4eefe686/attachment.obj 
