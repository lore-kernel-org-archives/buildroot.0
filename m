From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Fri, 26 Feb 2010 11:11:36 -0800
Subject: [Buildroot] Buildroot 2010.02 "echo foo"
Message-ID: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see "echo foo" in output of make just before it breaks because it
wants to copy mkdosfs from dosfstools before having built the package.

I see the "echo foo" and make dependency commented out in recent patch
and commit wrt dosfstools package (in dosfstools.mk).

 

Was this debug intended to be removed before the release?

 

Regards

 

Darcy

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100226/4df876b4/attachment-0001.htm>
