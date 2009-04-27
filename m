From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 27 Apr 2009 10:26:07 +0200
Subject: [Buildroot] svn commit: [26202] trunk/buildroot/toolchain/uClibc
In-Reply-To: <20090424184219.14D7077148@busybox.osuosl.org>
References: <20090424184219.14D7077148@busybox.osuosl.org>
Message-ID: <1240820767.6699.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-04-24 at 18:42 +0000, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2009-04-24 18:42:18 +0000 (Fri, 24 Apr 2009)
> New Revision: 26202
> 
> Log:
> toolchain/uClibc: 0.9.30.1 getaddrinfo fix for intfs without address

Does this fix the issues that are the reason for
UCLIBC_SUPPORT_AI_ADDRCONFIG not being enabled by default or is this
unrelated? Otherwise perhaps the default could be changed now, which
would us allow to get the gupnp stack into buildroot (see
https://bugs.busybox.net/show_bug.cgi?id=35).


Sven
