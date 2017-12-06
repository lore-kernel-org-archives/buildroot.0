From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 6 Dec 2017 19:20:00 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <20171206125530.GB2890@lianli.shorne-pla.net>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
 <20171128064921.GA27558@waldemar-brodkorb.de>
 <20171206004159.GA2890@lianli.shorne-pla.net>
 <CACPK8XcCua5m5HgaTP97=ccg8RTgFuRcwGAepRx6+_ocWc5mRw@mail.gmail.com>
 <20171206125530.GB2890@lianli.shorne-pla.net>
Message-ID: <20171206182000.GE27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stafford,
Stafford Horne wrote,

> I was thinking we can just update : libc/sysdeps/linux/common/syscall.c
> 
> There is not much openrisc specific about this.  But it's up to Waldemar.

What are the advantages or disadvantages using it in
common/syscall.c?

Does it might break support for existing architectures using no
special syscall.c/syscall.S?

best regards
 Waldemar
