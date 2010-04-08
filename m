From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Apr 2010 07:40:52 +0200
Subject: [Buildroot] [PATCH] matchbox-desktop: fix compilation and
	installation
In-Reply-To: <20100406203653.2470.27265.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Tue, 06 Apr 2010 23:36:53 +0300")
References: <20100406203653.2470.27265.stgit@localhost.localdomain>
Message-ID: <87r5mqpkm3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> Libtool patch applies just fine.
 Paulius> mbdesktop_modules is installed by the matchbox-desktop and we
 Paulius> don't have to overwrite it with our copy(contains wrong paths).

Committed, thanks!

-- 
Bye, Peter Korsgaard
