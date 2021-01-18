From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:09:16 +0100
Subject: [Buildroot] [PATCH] pkg-generic: host variant use git
 submodules if target variant does
In-Reply-To: <20210113221014.687702-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 13 Jan 2021 23:10:14 +0100")
References: <20210113221014.687702-1-yann.morin.1998@free.fr>
Message-ID: <87czy2f1n7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When a package has both a target and a host variant, and uses git
 > submodules, and the host variant is downloaded before the targt one, we
 > end up with the generated archive missing the submodules.

 > This happens in exactly one package in our tree: c-capnproto.

 > Weirdly enough, the issue was not caught until after we changed the way
 > we generate tar archives from git downloads.

 > Propagate the git submodule setting from the target variant to the host
 > variant, unless the host variant explicitly opted-out.

 > Fixes:
 >     http://autobuild.buildroot.org/results/2de9c6c8ce83569d18cc7140ebc60d6fe1aadcbf/

 > Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>


Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
