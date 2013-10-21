From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 21 Oct 2013 14:15:00 -0500
Subject: [Buildroot] Buildroot Package Mirror Script
Message-ID: <OF57CE4CB6.E374A8CA-ON86257C0B.0069B646-86257C0B.0069B7CF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P and/or Peter,

I was wondering if it would be possible to get a hold of the scripts that
are used to populate sources.buildroot.net mirror. Our build server
resides behind a very restrictive firewall and we would like to automate
(nightly) the pulling of new packages from the most recent version
of buildroot source. We've attempted to implement our own script to do 
this
with 'make allyespackageconfig' followed by 'make source', however, we
are running into a few gotchas so we were hoping that we could 
potentially piggy back off the work that has been done for the
sources.buildroot.net.

Please let me know if you are able to help.

Thanks,
-Ryan

------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 
