From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Feb 2014 20:40:42 +0100
Subject: [Buildroot] [pkg-perl infra V6 1/9] host-perl: export and
	rename PERL5LIB
In-Reply-To: <1392034997-12394-2-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 10 Feb 2014 13:23:08 +0100")
References: <1392034997-12394-1-git-send-email-francois.perrad@gadz.org>
 <1392034997-12394-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <87r47aycw5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > The official Perl documentation refers only to PERL5LIB.
 > PERLLIB is obsolete, we don't need to be compatible with Perl4.

 > PERL5LIB is used in all environment, so it is simpler to just export it.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
