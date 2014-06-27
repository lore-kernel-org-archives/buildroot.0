From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 00:01:26 +0200
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
Message-ID: <20140628000126.4bfd6329@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Panahi Parsa,

On Sat, 28 Jun 2014 00:58:31 +0430, Panahi Parsa wrote:

> *** These auxiliary programs are missing or incompatible versions: makeinfo
> autoconf
> *** some features will be disabled.
> *** Check the INSTALL file for required versions.
> checking LD_LIBRARY_PATH variable... contains current directory
> configure: error:
> *** LD_LIBRARY_PATH shouldn't contain the current directory when
> *** building glibc. Please change the environment variable
> *** and run configure again.
> make: ***
> [/home/parsa/Software/Buildroot/buildroot/output/build/glibc-2.18/.stamp_configured]
> Error 1
> 
> parsa at parsa-System-Product-Name:~/Software/Buildroot/buildroot$
> 
> It seems that I should change LD_LIBARAY_PATH to include glibc environment
> variables !! Since I'm new to buildroot I don't know how I should do this.
> 
> Is there some one who can tell me the steps to solve this problem ?

Can you post the output of the "env" command in the terminal you used
Buildroot?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
