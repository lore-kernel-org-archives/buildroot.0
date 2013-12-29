From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 14:08:49 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: bump to version 2.6.3
In-Reply-To: <1388250659-10192-1-git-send-email-romain.naour@openwide.fr>
References: <1388250659-10192-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20131229140849.66608351@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 28 Dec 2013 18:10:58 +0100, Romain Naour wrote:
> Add --disable-doc-install to configure script.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/xenomai/xenomai.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This bump is causing build failures. See:

  http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log

rtdm.c:111:4: error: expected identifier or '(' before 'else'
rtdm.c:116:2: error: expected identifier or '(' before 'return'
rtdm.c:117:1: error: expected identifier or '(' before '}' token

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
