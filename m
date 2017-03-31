From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 13:20:19 +0200
Subject: [Buildroot] [PATCH] package/coreutils: remove legacy comment
In-Reply-To: <20170330211143.6645-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 30 Mar 2017 23:11:43 +0200")
References: <20170330211143.6645-1-yann.morin.1998@free.fr>
Message-ID: <87vaqpvgjw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This comment was added in 2007 (e4c6340a: cleanup and fixes), back when
 > removing a package was (seemingly) supported.

 > This ability was lost when coreutils was converted to autotarget in 2010
 > (386183f: coreutils: convert to autotarget), but the comment stuck.

 > Get rid of it: it nowadays does not make sense and is a bit confusing.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
