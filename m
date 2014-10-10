From: Pedro Silva <psnsilva.stuff@gmail.com>
Date: Fri, 10 Oct 2014 15:43:57 +0100
Subject: [Buildroot] Perl libraries/modules sub-menu is empty
Message-ID: <CAP6ETiSDXeQJhUG5b4o37HoesirmzYUncWLTghn0G5TUJ-TA-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
I am trying to add "mosh" (mobile shell) to buildroot but it is missing
some perl modules, namely the socket module...
? The error is: ?Can't locate Socket.pm in @INC (you may need to install
the Socket module)?.

?The problem is that in buildroot, with perl package checked ("Interpreter
languages and scripting"), the ?"Perl libraries/modules" is empty and cause
of that I am not able to select any additional module.
?Any hint on this issue??

I send an screenshot in attachment.

?Thanks in advance.?
?Best regards,?
Pedro Silva
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141010/0ce09b6f/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 20141010_perl_modules_empty.png
Type: image/png
Size: 47814 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141010/0ce09b6f/attachment.png>
