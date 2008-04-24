From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 15:48:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
In-Reply-To: <20080424133421.GA11391@mx.loc> (Bernhard Fischer's message of
	"Thu\, 24 Apr 2008 15\:34\:21 +0200")
References: <20080424131426.5FAF93C824@busybox.net>
	<20080424133421.GA11391@mx.loc>
Message-ID: <87r6cv5pp1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> +ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++ -lX11"
 >> 

 Bernhard> and why is having "avr32" in there sane?

My thoughts exactly.

-- 
Bye, Peter Korsgaard
