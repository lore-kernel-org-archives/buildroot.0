From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 00:53:03 +0100
Subject: [Buildroot] [PATCH 2/4] package/qemu: fix host dependencies
In-Reply-To: <f3379896be4cbb7b0c1348fb207ecd6696702842.1355434710.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 13 Dec 2012 22:39:38 +0100")
References: <cover.1355434710.git.yann.morin.1998@free.fr>
 <cover.1355434710.git.yann.morin.1998@free.fr>
 <f3379896be4cbb7b0c1348fb207ecd6696702842.1355434710.git.yann.morin.1998@free.fr>
Message-ID: <87vcc5jyqo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> 'host-*' packages should depends on other 'host-*' packages,
 Yann> not on target packages.

Committed, thanks.

-- 
Bye, Peter Korsgaard
