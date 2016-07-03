From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 11:21:21 +0200
Subject: [Buildroot] [PATCH 2/3] package/sunxi-mali: use git submodules
In-Reply-To: <81489a109ac06794b609bd468787d01475e3f61c.1467534694.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 3 Jul 2016 10:33:10 +0200")
References: <cover.1467534694.git.yann.morin.1998@free.fr>
 <81489a109ac06794b609bd468787d01475e3f61c.1467534694.git.yann.morin.1998@free.fr>
Message-ID: <877fd313hq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The sunxi-mali git tree is set up with a submodule that contains the
 > actual libraries. Since there was no support for git submodules so far,
 > we used a dirty trick to have that submodule cloned by its own package,
 > with sunxi-mali just vampirising it into its own build dir.

 > Now that we have support for git submodules, we can simplify stuff a
 > bit, and have sunxi-mali directly download the proprietary libs itself.

 > Remove the .hash file since we're not checking hashes for git clones.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
