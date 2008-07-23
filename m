From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 14:09:06 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
In-Reply-To: <20080723112738.GA26543@mx.loc> (Bernhard Fischer's message of
	"Wed\, 23 Jul 2008 13\:27\:38 +0200")
References: <20080723103553.C15B83C806@busybox.net>
	<20080723112738.GA26543@mx.loc>
Message-ID: <87od4ox0nx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
 >> -grep: uclibc gettext libintl grep-target_binary
 >> +grep: uclibc $(GNUGREP_EXTRA_DEPS) grep-target_binary

 Bernhard> grep: uclibc $(if $(BR2_ENABLE_LOCALE),gettext libintl) \
 Bernhard> 	$(TARGET_DIR)/$(GNUGREP_TARGET_BINARY)

 Bernhard> would have been less chatty, fwiw.

True. It does make for a pretty long line though - Fixed.

Thanks.

-- 
Bye, Peter Korsgaard
