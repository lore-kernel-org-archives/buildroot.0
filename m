From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 1 Jan 2018 19:17:31 +0100
Subject: [Buildroot] [PATCH v2] nilfs-utils: add new package
In-Reply-To: <20171231175734.3eb75ffd@windsurf>
References: <1514490355-5272-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20171231175734.3eb75ffd@windsurf>
Message-ID: <20180101181731.GA22682@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hello,
> 
> On Thu, 28 Dec 2017 20:45:55 +0100, Kurt Van Dijck wrote:
> 
> > +NILFS_UTILS_VERSION = v2.2.7
> > +NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,$(NILFS_UTILS_VERSION))
> > +NILFS_UTILS_LICENSE = LGPL-2.1
> 
> This license information was not quite correct. The top of the COPYING
> file says:
> 
> This package, the NILFS2 filesystem utilities, are made available
> under the GNU Public License version 2, with the exception of the
> lib/nilfs libraries and their header files, which are made available
> under the GNU Lesser General Public License Version 2.1
> 
> So I've changed to:
> 
> NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)

I couldn't have created such line by myself.
I apologise for being so incorrect.
Thanks for correcting me on this.

Kurt
