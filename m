From: Robert B. Williams <rwilliams@valcom.com>
Date: Wed, 26 Nov 2008 12:41:29 -0500
Subject: [Buildroot] php missing libraries during linking
Message-ID: <492D8A49.2090108@valcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know that I need to add -ldl to the linking process in the php build.

Otherwise is complains about dlopen being undefined.  I manually put it 
in the php Makefile directory and that solved the problem.  So my 
question is, where do I add it in buildroot to make it permanent?

Sorry I am still learning the ins and outs. 
