From: hartleys <hartleys@visionengravers.com>
Date: Fri, 9 May 2008 21:53:34 -0400
Subject: [Buildroot] httpd question
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I enabled the webif package and httpd in buildroot. Everything builds ok
and my system boots. But when I try to access the web interface I get
the following message in my browser:

httpd: bind: Address already in use

If I start the httpd service on a different port (8080) it works fine.

For the life of me I can't figure out what might already be bound to
port 80. Any ideas?

Thanks,
Hartley
