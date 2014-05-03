From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:39:20 +0200
Subject: [Buildroot] [PATCH 05/12] boot/syslinux: move comments out of
	define-block
In-Reply-To: <758858debbeeb3f3bbc427ebe348986af6417d66.1399050467.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 2 May 2014 19:10:31 +0200")
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <758858debbeeb3f3bbc427ebe348986af6417d66.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <87wqe2mz2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The comments are mot really part of the command we want to execute,

s/mot/not/


 > so move themn out of the define-block. This also cleans up the output,

s/themn/them/

Committed, thanks.

-- 
Bye, Peter Korsgaard
