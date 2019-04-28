From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Apr 2019 22:09:07 +0200
Subject: [Buildroot] [PATCH] package/binutils: don't override the build
 command
In-Reply-To: <20190427160614.8747-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 27 Apr 2019 18:06:14 +0200")
References: <20190427160614.8747-1-yann.morin.1998@free.fr>
Message-ID: <87v9yxsxi4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In 1d42d0acca (binutils: ensure TARGET_CONFIGURE_ARGS is taken into
 > consideration for subdirs), the whole BUILD_CMDS was overriden in an
 > attempt to ensure that the target configure args (in fact, environment
 > variables) are indeed passed in the environment of the build command.

 > However, there is no reason to override the whole command, when we can
 > simply specify additional environment variables, as supported by the
 > autotools infra.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
