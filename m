From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Wed, 20 Nov 2013 12:03:30 +0100 (CET)
Subject: [Buildroot] autobuild annotations
In-Reply-To: <20131120115934.356d52c3@skate>
Message-ID: <403618053.13241218.1384945410540.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





> 
> Jenkins just doesn't work for random builds.
> 
> Jenkins is designed to build the same configuration over and over
> again, and make comparisons from one build to another: the build was
> working yesterday, it's failing today, here is the set of commits
> that
> have been made between yesterday and today, and therefore the problem
> is somewhere in these commits. Jenkins is really good for that, and
> we
> already use it to build all the Buildroot defconfigs every day.
> 
> However, what autobuild.buildroot.org is doing are *random*
> configurations. I.e you cannot compare one build to another. This
> really doesn't fit well in the model of Jenkins in my opinion, and is
> the reason why a small specific tool was written.
> 

couldn't failed build configurations be forwarded to jenkins for monitoring ?

Jenkins could drop those compilations once they work again, that would provide
some form of followup...
