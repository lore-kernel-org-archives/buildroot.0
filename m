From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 12 Apr 2007 09:03:38 +0200
Subject: [Buildroot] C++ support not working by Buildroot
In-Reply-To: <MAILrRjbDt3HvoFOAmE000001a9@mail.tokheimkaizen.com>
References: <MAILrRjbDt3HvoFOAmE000001a9@mail.tokheimkaizen.com>
Message-ID: <20070412070338.GB4244@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 12, 2007 at 09:18:57AM +0530, Samir wrote:
>Dear All
>
> 
>
>I am building Tool chain using Build root.
>
>My target is at91rm9200(arm920t).
>
> 
>
>I also enable C++ support for that.
>
>Tool chain is build successfully 
>
> 
>
>But when I compile my CPP project.
>
>It doesn't work.
>
>The ERROR is:
>
>/home/buildroot/build_arm/staging_dir/gcc/arm-linux-uclibc/3.4.6/../../../ar
>m-linux-uclibc/bin/ld:test1.o: Relocations in generic ELF (EM: 3).

4.1.2 and 4.2 work for me, fwiw.
