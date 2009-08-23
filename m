From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Aug 2009 13:43:56 +0200
Subject: [Buildroot] Build Bug
In-Reply-To: <1250036744.902.3.camel@localhost.localdomain> (sp3x's message of
	"Wed\, 12 Aug 2009 02\:25\:44 +0200")
References: <1250036744.902.3.camel@localhost.localdomain>
Message-ID: <874oryrc03.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sp3x" == sp3x  <info@sp3x.de> writes:

 sp3x> Hi again,
 sp3x> make: /usr/bin/install: Kommando nicht gefunden

So you don't have the 'install' program (or atleast not in
/usr/bin). What distribution is this?

What does 'which install' give?

Please direct questions / bugreports to the buildroot list
(buildroot at uclibc.org) in the future.

 sp3x> Missing link:
 sp3x> ln -s /bin/install /usr/bin/


-- 
Bye, Peter Korsgaard
