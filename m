From: Daniel Frey <dmfrey+linux@gmail.com>
Date: Mon, 3 Sep 2007 20:55:39 -0400
Subject: [Buildroot] Is there an issue with the xml2 installation packaged
	with BuildRoot?
Message-ID: <b6838d3a0709031755t6ea9e0eo2210fb6eb3881078@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to link against libxml2 when I am building my other
applications.  I continually get errors that I cannot link against libxml.
Could this be a result of how xml2 is installed.  If I look at
$(STAGING_DIR)/usr/bin/xml2-conf, the paths are setup for the local
environment ( i.e. /usr/lib/...).  and not relative to the $(STAGING_DIR) or
$(TARGET_DIR).  The same goes for $(STAGING_DIR)/usr/lib/xml2Conf.sh

Output:
checking for xmlParseFile... no
configure: error: Unable to link with libxml


Can anyone provide some clarification for me?

Thanks.
Dan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070903/9eea06e1/attachment.htm 
