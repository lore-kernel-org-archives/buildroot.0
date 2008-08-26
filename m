From: Steve Spano <steve@fl-eng.com>
Date: Tue, 26 Aug 2008 18:42:52 -0400
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <20080826223720.B77253C6C1@busybox.net>
Message-ID: <00b101c907cd$12fa1840$1a01a8c0@flexeon32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am stumped on this issue

I have a buildroot filesystem running and I cannot seem to execute new files
that I have placed on it.

For example, I upload a new executable file that I compile on a host PC. 
I change its permissions to execute and I type "./myfile"
It comes back saying "-sh: myfile not found"
BUT, I can vi the file, I can copy it, delete it /etc/etc
If I change its permissions to read-only and then try to execute it, the
shell tells me "permission denied". 

What could be occurring here?

Steve Spano, President
Finger Lakes Engineering
