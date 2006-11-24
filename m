From: Real.Magic at gmx.de <Real.Magic@gmx.de>
Date: Fri, 24 Nov 2006 11:53:12 +0100
Subject: [Buildroot] problem with absolute paths to tools in ccache
Message-ID: <20061124105312.100310@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all!

I have got a problem because ccache is using absolute paths to the ccache working directory and to the tools like gcc.

To prevent ccache from using an absolute path to the ccache working directory, I have applied the following patch successfully:

http://www.busybox.net/lists/buildroot/2006-October/000355.html

 
But how can I prevent ccache from using absolute paths to tools like gcc?


Kind regards,

Matthias


-- 
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen! 
Ideal f?r Modem und ISDN: http://www.gmx.net/de/go/smartsurfer
