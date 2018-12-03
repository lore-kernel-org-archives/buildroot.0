From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:12:22 +0100
Subject: [Buildroot] [PATCH 1/3 v2] infra/pkg-golang: enforce number of
 parallel jobs
In-Reply-To: <951dd893ccaa0d4a894bfcac76dc04e28d9acafb.1543137559.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 25 Nov 2018 10:19:48 +0100")
References: <cover.1543137559.git.yann.morin.1998@free.fr>
 <951dd893ccaa0d4a894bfcac76dc04e28d9acafb.1543137559.git.yann.morin.1998@free.fr>
Message-ID: <877egq2rax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > By default, the go compiler will spawn as many jobs as there are CPUs
 > available, thus possibily over-shooting the limits set by the user.

 > Make it abide by the user's wish, and specify the number of jobs allowed
 > to run.

 > We can do so without fear of a package failing to build in parallel,
 > because they were already all building in parallel, as that is the
 > default for the go compiler.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
