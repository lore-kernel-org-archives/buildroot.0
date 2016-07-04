From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 10:46:41 +0200
Subject: [Buildroot] [PATCH] package/gcc: fix list of files of patch
	file to hash for ccache
In-Reply-To: <1467561610-24799-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 3 Jul 2016 18:00:10 +0200")
References: <1467561610-24799-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d1mtkcy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When we build the list of patches to include to compute the hash for
 > ccache, a typo precented the special gcc-initial/ and gcc-final/
 > directories from a global patch dir to be included in the caclculation.

 > Fix that by properly expanding the $(PKG) variable.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: He Chunhui <hchunhui@mail.ustc.edu.cn>

Committed, thanks.

-- 
Bye, Peter Korsgaard
