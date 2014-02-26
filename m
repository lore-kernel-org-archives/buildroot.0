From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Wed, 26 Feb 2014 23:46:33 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530E60FF.6090300@mind.be>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUbFzxUgz+kkes-f7TO0as40kDuaF+v6BG2neWEBeR-hw@mail.gmail.com>
 <530E1C12.9090400@gmail.com> <530E60FF.6090300@mind.be>
Message-ID: <530E6EC9.6090400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 26/02/2014 22:47, Arnout Vandecappelle ha scritto:
> This smells like our external toolchain logic doesn't properly locate 
> and copy the sysroot. Can you verify if output/staging/usr/lib/crt1.o 
> exists? 


Yes, it exists!


> Perhaps if you can give the URL of this external toolchain, we can 
> have a look? Regards, Arnout 


https://github.com/embest-tech/fsl-linaro-toolchain

Thank you!
Marco
