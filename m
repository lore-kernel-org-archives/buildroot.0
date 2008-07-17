From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jul 2008 00:17:37 +0200
Subject: [Buildroot] phy driver
In-Reply-To: <487FBBC6.8070107@acsatlanta.com> (Joseph G. Boike's message of
	"Thu\, 17 Jul 2008 16\:38\:14 -0500")
References: <487FBBC6.8070107@acsatlanta.com>
Message-ID: <87k5fkm9z2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph G Boike <joe.boike@acsatlanta.com> writes:

Hi,

 Joseph> I've updated the phy driver for smsc devices (smsc.c ).
 Joseph> (Which is a question in itself; where do I submit the patch?)
 Joseph> It had worked fine with 2.6.22 but 2.6.25 & 2.6.26 seem to
 Joseph> have a preference for the generic driver @ phy address 0 over
 Joseph> my h/w specific driver for the phy @ phy address 0x1F.  Any
 Joseph> suggestions?  Regards, Joe

Wrong list - I guess you meant to send this to netdev at vger.kernel.org
instead?

-- 
Bye, Peter Korsgaard
