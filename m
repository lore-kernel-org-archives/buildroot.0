From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 25 Feb 2014 14:34:12 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <CAAXf6LUnOyzHbSaOZtcBak55CQuKr=zSzzgH8zLkaF7zGPdSVw@mail.gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
 <CAAXf6LUnOyzHbSaOZtcBak55CQuKr=zSzzgH8zLkaF7zGPdSVw@mail.gmail.com>
Message-ID: <530C9BD4.2020201@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 25/02/2014 14:10, Thomas De Schampheleire ha scritto:
> The external toolchain wrapper is created automatically by buildroot 
> when the toolchain is 'installed'. However, above I see two different 
> paths: /home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper 
> and ~/dev/buildroot/output/host/usr/bin/ Have you moved the buildroot 
> repository to another location? Normally the toolchain wrapper is 
> located in <output>/host/usr/bin, just like the symbolic links that 
> point to it. Best regards, Thomas 

Thomas,
the first path:

/home/marco/dev/fsl-linaro-toolchain/fsl-linaro-toolchain/bin

is where I put my toolchain.
The second one:

home/marco/dev/buildroot/output/host/usr/bin/

is where buildroot wrapped the toolchain, but of course 
/home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper does not 
exist!

I tried to let buildroot to download the tarball but it's the same.
In the meanwhile I fix this issue I'm compiling using the built-in 
codesourcery toolchain.

Best regards
Marco
