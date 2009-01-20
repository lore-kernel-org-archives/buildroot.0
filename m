From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 23:34:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/xerces
In-Reply-To: <20090120213447.41570770AD@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Tue\, 20 Jan 2009 21\:34\:47 +0000 \(UTC\)")
References: <20090120213447.41570770AD@busybox.osuosl.org>
Message-ID: <87y6x5vc74.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-20 21:34:46 +0000 (Tue, 20 Jan 2009)
 ulf> New Revision: 24928

 ulf> Log:
 ulf> Bump xerces-c to latest stable, ARM build now completes

 ulf> Modified:
 ulf>    trunk/buildroot/package/xerces/Config.in
 ulf>    trunk/buildroot/package/xerces/xerces.mk

How about converting to Makefile.autotools.in format while you're at
it?

 ulf> +xerces-unpacked: $(XERCES_DIR)/.unpacked
 ulf> +
 ulf>  xerces-clean:
 ulf>  	rm -rf $(STAGING_DIR)/usr/include/xercesc
 ulf>  	rm -f $(STAGING_DIR)/lib/libxerces*

TARGET_DIR cleanup stuff seems to be missing.

-- 
Bye, Peter Korsgaard
