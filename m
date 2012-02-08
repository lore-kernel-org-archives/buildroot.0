From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 8 Feb 2012 13:24:01 +0100
Subject: [Buildroot] problem creating package : download fails ! (buildroot
	appends netpbm-10.35.83.gz
Message-ID: <ABF59CC0FD964B918D2A589BD7790307@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I have a problem in creating a package : the download link does not work 

The link is 
http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz 

But buildroot seems to append netpbm-10.35.83.gz

So it tries http://kent.dl.sourceforge.net/project/netpbm/super_stable/10.35.83/netpbm-10.35.83.tgz/netpbm-10.35.83.gz

That fails.

How to resolve this ?

Johan
