From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:42:24 +0200
Subject: [Buildroot] [PATCH] package/kyua: fix unmet dependencies
In-Reply-To: <20170505190826.11902-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 5 May 2017 21:08:26 +0200")
References: <20170505190826.11902-1-yann.morin.1998@free.fr>
Message-ID: <87lgpylam7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > lutok is a lua module, so it depends on ! static libs. However, the
 > dependency is implicit, being done because the lua modules are sourced
 > globally under an if-block, and thus it is not easy to find that
 > dependency.

 > Propagate that dependency to kyua, which was missing it (because it is
 > not a lua module, so was missing the dependency).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
