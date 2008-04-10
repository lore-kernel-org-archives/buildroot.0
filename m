From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 20:59:44 +0200
Subject: [Buildroot] advice on makefile
In-Reply-To: <1207851468.6817.498.camel@nigel-x60> (Nigel Kukard's message of
	"Thu\, 10 Apr 2008 18\:17\:48 +0000")
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
	<1207836719.6817.433.camel@nigel-x60>
	<8763upaice.fsf@macbook.be.48ers.dk>
	<1207848484.6817.490.camel@nigel-x60>
	<1207848653.6817.493.camel@nigel-x60>
	<87fxtt8tur.fsf@macbook.be.48ers.dk>
	<1207851468.6817.498.camel@nigel-x60>
Message-ID: <871w5d8rj3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:

Hi,

 Nigel> OMW!! ..... after looking over autotools .... I think it should rather
 Nigel> be improved and everything converted to autotools ... most of the stuff
 Nigel> is standardized then. It would just be a small task of catching some
 Nigel> specifics and adding a few more features...
 >> 
 >> Yes, I also think that's the best long term solution (similar to how
 >> it's done in openwrt, openembedded, ...).

 Nigel> I think it needs a bit more magic though ...

;)

 Nigel> I'll convert some of the things I've done so far to beecrypt,
 Nigel> make files reduce from 100+ lines down to +- 10 ... its
 Nigel> amazing!

 Nigel> Do we have a wiki where this can be documented?  would also
 Nigel> suggest we not accept any patches with manual makefiles?
 Nigel> unless there is a very good reason autotools cannot handle it,
 Nigel> in which case autotools should be fixed not complexity added.

No, but we have docs/ ;)

-- 
Bye, Peter Korsgaard
