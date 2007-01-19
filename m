From: Thilo Riessner <thilo@riessner.de>
Date: Fri, 19 Jan 2007 13:31:06 +0100
Subject: [Buildroot] chown to root does not work
Message-ID: <200701191331.07579.thilo@riessner.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the docs is mentioned, that one doesn't need to be root to build a root 
filesystem. But when building the filesystem as a normal user, chown is not 
able to change owner to root in the target filesystem. Is there a solution of 
the problem, that I don't see?
