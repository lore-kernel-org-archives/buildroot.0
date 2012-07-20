From: Richard Braun <rbraun@sceen.net>
Date: Fri, 20 Jul 2012 17:58:07 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <2133019142.1267214.1342798484932.JavaMail.root@mail.savoirfairelinux.com>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <2133019142.1267214.1342798484932.JavaMail.root@mail.savoirfairelinux.com>
Message-ID: <20120720155807.GA10741@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 20, 2012 at 11:34:44AM -0400, ?meric Vigier wrote:
> Your patch makes -reconfigure clean-for-rebuild and then (just) -configure, without rebuilding.
> That's ok to me, but you have to choose between:
> 
> 1. updating docs/manual/rebuilding-packages.txt accordingly, especially:
> "For convenience, most packages support the special make targets
> <package>-reconfigure and <package>-rebuild to repeat the configure
> and build steps"

I may misunderstand what you mean, because, when reading this part, I
understand that "-reconfigure and -rebuild" "repeat the configure and
build steps". It may lack a formal "respectively", but other than that,
it's exactly what my patch does by calling only -configure.

-- 
Richard Braun
