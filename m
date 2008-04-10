From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 17:30:53 +0000
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207848484.6817.490.camel@nigel-x60>
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
	<8763upaice.fsf@macbook.be.48ers.dk>
	<1207848484.6817.490.camel@nigel-x60>
Message-ID: <1207848653.6817.493.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> <snip snip snip>
> 
> Regarding dependencies on other targets ... what about having something
> like   $(PKGNAME_LIB_VERSION) variable?
> 
> or maybe ....  PKGNAME_LIB_NAME?   or   PKGNAME_LIB_STAGING_TARGET?
> 
> or all of them?
> 
> PKGNAME_LIB_VERSION=1.2.3
> PKGNAME_LIB_NAME=libfubar.$(PKGNAME_LIB_VERSION)
> PKGNAME_LIB_STAGING_TARGET=$(STAGING_DIR)/usr/lib/$(PKGNAME_LIB_NAME)
> 
> starting to look like something that should be part of autotools?
> 
> really getting frustrated ... everything is different!  :(
> 

OMW!! ..... after looking over autotools .... I think it should rather
be improved and everything converted to autotools ... most of the stuff
is standardized then. It would just be a small task of catching some
specifics and adding a few more features...

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/5b6d952d/attachment.pgp 
