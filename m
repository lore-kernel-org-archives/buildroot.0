From: Philippe Ney <philippe.ney@pardes.ws>
Date: Tue, 10 Apr 2007 09:59:45 +0200
Subject: [Buildroot] Building GCC/C++ compilers using Buildroot
In-Reply-To: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
References: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
Message-ID: <20070410095945.a9927000.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Tried to upgrade my ARM gcc-3.4.6 compiler in buildroot
> My host compiler is gcc-4.1.2 running on OpenSuse 10.2.
> 
> First tried gcc-4.2 and latest supported binutils    - Failed
> Then tried gcc-4.2 and binutils-2.17    failed.
> Looked into the error messages and found that the problem
> seems to occur when building the C++ compilers.
> 
> Now trying gcc-4.1.2 and binutils-2.17 without C++ compilers.
> 
> Whats is a recommended combination of gcc and binutils 
> if you want to have a c++ cross compiler?

Hello,

gcc 4.0.3 with binutils 2.17 works for me with gcc 4.1.2 (Debian)
and gcc 4.0.3 (Ubuntu).

Philippe
