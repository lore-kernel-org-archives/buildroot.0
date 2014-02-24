From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Feb 2014 21:28:18 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: remove 2.6 snapshot
In-Reply-To: <20140224175922.GA11048@free.fr> (Yann E. MORIN's message of
 "Mon, 24 Feb 2014 18:59:22 +0100")
References: <1393187673-16648-1-git-send-email-yann.morin.1998@free.fr>
 <530AEFC9.1040508@mind.be> <20140224175922.GA11048@free.fr>
Message-ID: <8738j8mf19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> This is missing Config.in.legacy support. The help text of the legacy
 >> support should mention that the same can be achieved by using
 >> BR2_LINUX_KERNEL_CUSTOM_TARBALL.

 > In retrospect, BR2_LINUX_KERNEL_CUSTOM_TARBALL is for building the
 > kernel. It is not used to install the headers, which is what we are
 > doing here.

True. A custom version (but still mainline kernel) can be handled
through BR2_KERNEL_HEADERS_VERSION, but it isn't exactly the same as the
custom tarball.

-- 
Bye, Peter Korsgaard
