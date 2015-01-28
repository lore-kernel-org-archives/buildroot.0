From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 22:00:38 +0100
Subject: [Buildroot] [PATCH v3 1/2] python-markupsafe: allow build as
	host package
In-Reply-To: <1422458063-5725-1-git-send-email-erico.nunes@datacom.ind.br>
 (Erico Nunes's message of "Wed, 28 Jan 2015 13:14:22 -0200")
References: <1422458063-5725-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <87oapivcw9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <erico.nunes@datacom.ind.br> writes:

 > python-markupsafe is a dependency for python-jinja2, which can be used
 > during build time as a host tool to generate code based on templates.
 > This package is being added host package support mostly to allow
 > host-python-jinja2 to build.
 > This has been tested to build and work correctly as a host tool as well.

 > Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
