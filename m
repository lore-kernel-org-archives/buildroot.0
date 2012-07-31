From: Steve Goldberg <indeliblesteve@hotmail.com>
Date: Tue, 31 Jul 2012 03:24:50 -0700
Subject: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
Message-ID: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm putting together a TI toolchain package but as some of the required packages are export controlled I need to host them on my institutional machine to control access.  I think scp is the best choice for this but the scp scheme does not prompt for passwords and users who haven't setup public-key ssh access are unable to download the packages.  Why does the DOWNLOAD_SCP scheme not prompt the user for a password?
Thanks.
Steve Goldberg 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120731/db4dea5e/attachment.html>
