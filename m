From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Oct 2018 21:47:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/linux-headers: really drop the
 4.17 choice
In-Reply-To: <c1b6a02f6b6624c3138535318f5bfe6e9090ce4b.1538683163.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 4 Oct 2018 22:00:30 +0200")
References: <cover.1538683163.git.yann.morin.1998@free.fr>
 <c1b6a02f6b6624c3138535318f5bfe6e9090ce4b.1538683163.git.yann.morin.1998@free.fr>
Message-ID: <87o9c5pmiw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the build fails when the kernel headers 4.17 are selected:
 >     package/linux-headers/linux-headers.mk:149: *** LINUX_HEADERS_SITE
 >     cannot be empty when LINUX_HEADERS_SOURCE is not.  Stop.

 > This is caused by an hickup during the last merge of the next branch,
 > where the value for 4.17 got dropped from BR2DEFAULT_KERNEL_HEADERS,

BR2_DEFAULT_KERNEL_HEADERS

Committed, thanks.

-- 
Bye, Peter Korsgaard
