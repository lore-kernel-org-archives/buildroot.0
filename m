From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 20:47:01 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabreauto: Add openssl for
 kernel build
In-Reply-To: <20191026182015.9114-1-festevam@gmail.com> (Fabio Estevam's
 message of "Sat, 26 Oct 2019 15:20:15 -0300")
References: <20191026182015.9114-1-festevam@gmail.com>
Message-ID: <87tv7ve44a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <festevam@gmail.com> writes:

 > Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL in order to fix
 > the following build error:

 > scripts/Makefile.host:90: recipe for target 'scripts/extract-cert' failed
 > make[2]: *** [scripts/extract-cert] Error 1
 > make[2]: *** Waiting for unfinished jobs....

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/332655822

 > Signed-off-by: Fabio Estevam <festevam@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
