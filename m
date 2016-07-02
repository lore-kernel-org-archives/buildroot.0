From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 19:11:02 +0200
Subject: [Buildroot] [PATCH 4/4 v3] core/pkg-infra: download git
	submodules if the package wants them
In-Reply-To: <b9061693f4d7a2c7030190efd686c988c1278e43.1467363623.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 1 Jul 2016 11:01:19 +0200")
References: <cover.1467363623.git.yann.morin.1998@free.fr>
 <b9061693f4d7a2c7030190efd686c988c1278e43.1467363623.git.yann.morin.1998@free.fr>
Message-ID: <87ziq03qzd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Add a new package variable that packages can set to specify that they
 > need git submodules.

 > Only accept this option if the download method is git, as we can not get
 > submodules via an http download (via wget).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Aleksandar Simeonov <aleksandar@barix.com>
 > Tested-by: Matt Weber <matt@thewebers.ws>
 > Reviewed-by: Matt Weber <matt@thewebers.ws>
 > Tested-By: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 > ---
 > Changes v1 -> v2:
 >   - properly accept the -r in the download wrapper  (Aleksandar)

Committed, thanks.

Will you also send a patch to update the user manual?

-- 
Bye, Peter Korsgaard
