From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:52:31 +0200
Subject: [Buildroot] [PATCH] manual: patches are not applied for
	SITE_METHOD = local
In-Reply-To: <20170708201507.20746-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 8 Jul 2017 22:15:07 +0200")
References: <20170708201507.20746-1-arnout@mind.be>
Message-ID: <87eftca600.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > We had several remarks on the mailing list of users that were surprised
 > that patches were not applied for packages whose SITE_METHOD is local.
 > So document this.

 > Note that for OVERRIDE_SRCDIR itself it is already documented:

 >   When Buildroot finds that for a given package, an
 >   <pkg>_OVERRIDE_SRCDIR has been defined, it will no longer attempt to
 >   download, extract and patch the package. Instead, it will directly use
 >   the source code available in in the specified directory.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
