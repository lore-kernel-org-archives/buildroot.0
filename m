From: Paul Chavent <paul.chavent@fnac.net>
Date: Wed, 31 Oct 2012 19:19:56 +0100
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
Message-ID: <50916BCC.2080409@fnac.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On 10/31/2012 12:32 PM, Alexander Khryukin wrote:
> Hello.
> I'm trying to build busybox with glibc
> and faced with error
>
> util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory
>
> Does anybody have any solution?
>

I add the --enable-obsolete-rpc to the eglibc configure options.
