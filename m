From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 14 Oct 2013 09:40:46 +0200 (CEST)
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131014090904.1f20fcf4@skate>
Message-ID: <1959407319.8772723.1381736446742.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
> Again, for now, the core of the problem is to be able to *detect*
> when
> an upstream version is available for a given package. Once that is
> done, we will see at integrating that into the statistics page I
> mentioned earlier, and do all the automated execution.
> 


two ideas that might or might not be good ideas but are worth discussing
early :

* try to automatically build the new version to see if it is an "easy
bump" or a "hard bump" and document the result

* ping the last person(s) that touch the package (git has facilities to
find them, I think it's called git-contribute) when a new version is
available


both have good and bad sides, thus worth discussing...
