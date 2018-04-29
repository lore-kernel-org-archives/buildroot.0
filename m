From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:17:32 +0200
Subject: [Buildroot] [PATCH] speex: remove useless BUILD_CMDS
In-Reply-To: <20180429115948.22436-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 29 Apr 2018 13:59:48 +0200")
References: <20180429115948.22436-1-yann.morin.1998@free.fr>
Message-ID: <87lgd6w0zn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > SPEEX_BUILD_CMDS is useless, because it's exactly defined to the
 > default value of <pkg>_BUILDS_CMDS for autotools packages.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
