From: Nicolas Dade <nic.dade@mistsys.com>
Date: Fri, 10 Apr 2015 14:31:11 -0700
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local
 source code
In-Reply-To: <55283BBC.1040708@mind.be>
References: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
 <20150409221228.GC4192@free.fr>
 <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
 <55283BBC.1040708@mind.be>
Message-ID: <CAB7JjA9LNL8xBTajgc1++o0MFyaO1DjYDW9oDjp5w0QpJSswwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> leave it as an archive...zip...tarball

In truth it's delivered to me as a zip file inside a VM image. I run the VM
once to scp out the zip file. But that's no problem; I can repack it as a
tarball.

I considered doing what you two both propose: treat the SDK as a regular
tarball-based package and build just the pieces I wanted. However the
pristine zip file unpacks to 2.4GB. I have the disk space, but unpacking
that much several times still seems something to avoid.

I think I'll just continue to maintain my buildroot enhancement as a local
patch to buildroot itself.

> get rid of the 'local' site method

If you do that I'll be patching it back in too, locally of course.

Thanks for the feedback.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150410/8b2f5555/attachment.html>
