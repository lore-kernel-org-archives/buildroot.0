From: Rex Ashbaugh <rexa@xeratech.com>
Date: Mon, 12 May 2008 09:54:27 -0700
Subject: [Buildroot] httpd question
In-Reply-To: <1CF6EDDF0820924DA43C9A52FE7325950B5F057D@MI8NYCMAIL17.Mi8.com>
References: <1CF6EDDF0820924DA43C9A52FE7325950B569C1A@MI8NYCMAIL17.Mi8.com>
	<20080509204814.1151246e.tonyb@sysdev.org>
	<1CF6EDDF0820924DA43C9A52FE7325950B5F057D@MI8NYCMAIL17.Mi8.com>
Message-ID: <6311fe0b0805120954pc3ce04ep84c3ac483b58b550@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

what scripts are in your /etc/init.d/ directory?
do you have the inetd daemon installed?
-Rex

On Mon, May 12, 2008 at 9:15 AM, hartleys <hartleys@visionengravers.com>
wrote:

> On Friday, May 09, 2008 9:48 PM, Tony Borras wrote:
> > > when I try to access the web interface I get the following message
> in
> > > my browser:
> > >
> > > httpd: bind: Address already in use
> > >
> > > For the life of me I can't figure out what might already be bound to
>
> > > port 80. Any ideas?
> >
> > try:   nmap -p80 localhost
> >
> > or instead of localhost the name or ip of your host.
>
> I don't think nmap is available as a package in buildroot. At least I
> can't locate it.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080512/e9f69d3b/attachment.htm 
