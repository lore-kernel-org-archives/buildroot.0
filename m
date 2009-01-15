From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 15 Jan 2009 09:36:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20090114221114.73CB776C8E@busybox.osuosl.org>
References: <20090114221114.73CB776C8E@busybox.osuosl.org>
Message-ID: <20090115083621.GA15748@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 14, 2009 at 10:11:14PM +0000, ulf at uclibc.org wrote:
> 
> Log:
> Force use of HOST_GLIB instead of /usr/bin for libgtk2
> 
> Modified:
>    trunk/buildroot/package/libgtk2/libgtk2.mk

I'll repeat myself, please answer.

Any reason we do this instead of using good old PATH? 
Using PATH and having STAGING_DIR/BIN first in it will give the user an option 
to choose wether he wants to use the host provided or his own.

So what is wrong with PATH and makes this hack a necessity?


Thomas.
