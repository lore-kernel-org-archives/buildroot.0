From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:45 -0700
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
	DM365 processors
Message-ID: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I'd like some comment on the packages I've made to support TI's gstreamer 
plugin for the OMAP3 and DM365 processors. All packages compile using 
crosstool-ng and glibc, I have not yet tested them with BR's own internal 
toolchain and the uclibc at the moment. If anybody wants to test these package
I'll provide as much assistance as I can. I've publish my working branch at 
http://github.com/Admetric/buildroot

It's my first time posting patches so guidance and/or comments on how I'm 
sending the patches and on the patches themselves are welcome.

Thanks in advance,
Pierre-Luc
