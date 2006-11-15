From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 15 Nov 2006 12:59:10 +0100
Subject: [Buildroot] C++ cross compiler
In-Reply-To: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
Message-ID: <20061115125910.a375dcbd.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
>     Is it possible to generate a C++ (g++) cross compiler
> for ARM usng buildroot?  I have been able to generate
> a GCC cross compiler for ARM using buildroot.
> 
> Thanks for any pointers.

Sure.

$ make menuconfig

And check the right box.

Philippe
