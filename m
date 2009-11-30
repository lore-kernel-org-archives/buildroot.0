From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Nov 2009 16:06:53 +0100
Subject: [Buildroot] [PATCH][BUILD] Create $(TARGET_DIR)/usr/lib when
	installing
In-Reply-To: <1259589926.12315.10.camel@venture> (Clark Rawlins's message of
	"Mon\, 30 Nov 2009 09\:05\:26 -0500")
References: <1259589926.12315.10.camel@venture>
Message-ID: <87ocmkyrua.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clark" == Clark Rawlins <clark.rawlins@escient.com> writes:

 Clark> In some configurations $(TARGET_DIR)/usr/lib isn't
 Clark> created before the target install target for libncurses
 Clark> is run.  This change makes sure it is created before
 Clark> the install target copies files to it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
