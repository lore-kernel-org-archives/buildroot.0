From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 18 Sep 2008 11:53:07 +0200
Subject: [Buildroot] broken build rootfs workflow
In-Reply-To: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
References: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
Message-ID: <6a2e33620809180253t4b32032eu399ab6734076f367@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 18, 2008 at 10:48 AM, Fathi Boudra <fboudra@gmail.com> wrote:

> 2) my configuration files (UCLIBC_CONFIG_FILE/BUSYBOX_CONFIG_FILE) aren't
> passed correctly during build process:
> my provided uclibc.config is completely different from the generated/used
> .config.
>

My configuration file is copied properly, then a bunch of sed commands
modify it inside .oldconfig ???
I guess if I provide my own configuration file, I don't want my file
modified by random sed commands ?

As an example, unwanted modified parameters:

UCLIBC_HAS_LFS
UCLIBC_HAS_IPV6
UCLIBC_HAS_RPC
UCLIBC_HAS_FULL_RPC

UCLIBC_HAS_REENTRANT_RPC
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080918/cfb856a9/attachment.htm 
