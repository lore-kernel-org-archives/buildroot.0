From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 28 Nov 2006 13:34:54 +0100
Subject: [Buildroot] Problems at shutdown
In-Reply-To: <456C2A5C.9010307@computing.dundee.ac.uk>
References: <20061128100648.032E448587@busybox.net>
	<456C2A5C.9010307@computing.dundee.ac.uk>
Message-ID: <20061128123454.GA18735@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 12:23:56PM +0000, Peter Mendham wrote:
>I have a fairly vanilla buildroot system with just the basics of 
>BusyBox.  I get issues every time I boot as the filesystem has not been 
>unmounted before the previous shutdown.  It seems like the shutdown 
>entries in my inittab are being completely ignored .  I added a script 
>of my own (just some echos) as another shutdown and it too was ignored.  
>What am I doing wrong?

wrong list. Send your problem and of course your inittab to the busybox
list and do not forget to mention which version of busybox, which init
etc you're using.
