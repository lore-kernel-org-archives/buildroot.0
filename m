From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 10 Apr 2008 13:49:24 +0200
Subject: [Buildroot] How to move/rename/backup a buildroot directory ?
Message-ID: <006801c89b00$f079f990$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I've noticed that buildroot hard-codes its full path into some of its 
executables, making it impossible to move. Is there some workaround ?


And how do you backup a buildroot configuration (assuming I don't want to 
tar the whole tree) ?
- find -name .config
- local/
- target/generic/target_skeleton
Others ?

And how do you rebuild from backup ? Doing an svn checkout, cp Local 
followed by make doesn't cut it.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
