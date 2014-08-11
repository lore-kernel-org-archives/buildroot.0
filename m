From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 11 Aug 2014 15:13:29 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <20140811103315.GB4364@free.fr>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
 <20140811103315.GB4364@free.fr>
Message-ID: <CAJtjsKbV8zckWumUAsoV5sAG8wrO4Pqxm5UUdoaqDVPoCYjzSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Mon, Aug 11, 2014 at 12:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> My build machine is an x86_64, running an up-to-date Ubuntu 14.04.
> I'll check in a 32-bit chroot to see if the error is the same.

I removed ejabberd and all erlang packages installed on the host, even
purged them to be sure buildroot does not use their configuration
files. It is also an up-to-date Ubuntu 14.04 64bits.
After that, make clean all (with your minimal defconfig) still work :-/
Is there anything more I can do?

-- 
Johan
