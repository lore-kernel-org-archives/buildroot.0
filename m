From: hartleys <hartleys@visionengravers.com>
Date: Mon, 12 May 2008 12:15:38 -0400
Subject: [Buildroot] httpd question
In-Reply-To: <20080509204814.1151246e.tonyb@sysdev.org>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<20080509204814.1151246e.tonyb@sysdev.org>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B5F057D@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, May 09, 2008 9:48 PM, Tony Borras wrote:
> > when I try to access the web interface I get the following message
in 
> > my browser:
> > 
> > httpd: bind: Address already in use
> > 
> > For the life of me I can't figure out what might already be bound to

> > port 80. Any ideas?
>
> try:   nmap -p80 localhost
>
> or instead of localhost the name or ip of your host.

I don't think nmap is available as a package in buildroot. At least I
can't locate it.
