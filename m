From: Peter Mendham <petermendham@computing.dundee.ac.uk>
Date: Tue, 28 Nov 2006 12:23:56 +0000
Subject: [Buildroot] Problems at shutdown
In-Reply-To: <20061128100648.032E448587@busybox.net>
References: <20061128100648.032E448587@busybox.net>
Message-ID: <456C2A5C.9010307@computing.dundee.ac.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a fairly vanilla buildroot system with just the basics of 
BusyBox.  I get issues every time I boot as the filesystem has not been 
unmounted before the previous shutdown.  It seems like the shutdown 
entries in my inittab are being completely ignored .  I added a script 
of my own (just some echos) as another shutdown and it too was ignored.  
What am I doing wrong?

Thanks in advance,
-- Peter
