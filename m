From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Thu, 28 Aug 2008 06:16:31 -0700 (PDT)
Subject: [Buildroot]  Makefile.autotools.in improvements
Message-ID: <19200291.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


What do people think about adding 
HOOK_POST_EXTRACT and HOOK_POST_CONFIGURE
targets, the problem with libxml2 highlighted that I can not stop it trying
to do the ltmain.sh patch after an extract.  It then finds left over rubbish
(*.rej) and rejects.
However if I had a HOOK_POST_EXTRACT target I could extract tarball and then
delete rubbish and then let it do the ltmain.sh patching.

What do people think?
Daniel Laird
-- 
View this message in context: http://www.nabble.com/Makefile.autotools.in-improvements-tp19200291p19200291.html
Sent from the BuildRoot mailing list archive at Nabble.com.
