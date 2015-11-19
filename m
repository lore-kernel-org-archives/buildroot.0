From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 13:29:05 +0100
Subject: [Buildroot] [PATCH 1/1] perl-file-util: restore host variant
	and fix dependencies
In-Reply-To: <1447763046-25345-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Tue, 17 Nov 2015 10:24:06 -0200")
References: <1447763046-25345-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <87610y9nqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > The host variant was added by us (DATACOM) because it is useful to
 > build some third-party packages that we use in our firmware. We humbly
 > request you to keep it alive.

 > Declare that it requires host-perl-module-build.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
