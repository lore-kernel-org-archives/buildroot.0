From: hartleys <hartleys@visionengravers.com>
Date: Mon, 12 May 2008 22:21:25 -0400
Subject: [Buildroot] httpd question
In-Reply-To: <20080513021451.GA11213@cloud.net.au>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<482555F2.3080501@Kriegisch.name>
	<1CF6EDDF0820924DA43C9A52FE7325950B5F07A2@MI8NYCMAIL17.Mi8.com>
	<20080513004548.GB7473@cloud.net.au>
	<1CF6EDDF0820924DA43C9A52FE7325950B676C46@MI8NYCMAIL17.Mi8.com>
	<20080513021451.GA11213@cloud.net.au>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B676C89@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's what I figured. Still haven't tried to build a new toolchain.
That step scares me ;-) 

-----Original Message-----
From: Hamish Moffatt [mailto:hamish at cloud.net.au] 
Sent: Monday, May 12, 2008 7:15 PM
To: hartleys
Cc: Alexander Kriegisch; buildroot at uclibc.org
Subject: Re: [Buildroot] httpd question

On Mon, May 12, 2008 at 09:22:34PM -0400, hartleys wrote:
> Then I ran into a problem with awk built into busybox. I was getting a

> "can't resolve symbol '__fixdfsi'" error when webif ran some of it's 
> awk scripts. Using the real gawk package fixed that.

That would be a problem with your toolchain.. either gcc or uClibc, I'm
not sure which... Strange. busybox awk works for me (though I didn't
test the latest).


Hamish
--
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
