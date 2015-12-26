From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sat, 26 Dec 2015 10:27:58 +0100
Subject: [Buildroot] Nginx package
Message-ID: <567E5D9E.1030003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I have a question related to packages dependencies.

I have a case where i want to compile nginx with some additionnal 
modules (luajit).
I can define modules paths in the nginx config, but i don't find a way 
to say buildroot to compile these additional modules before nginx, 
otherwise than modifying nginx dependencies.

Is there a way to override dependencies of a package where a package is 
selected?

Regards,
Geoffrey Ragot
