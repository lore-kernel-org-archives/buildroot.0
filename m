From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 12:16:17 +0200
Subject: [Buildroot] problem building QT for geode (386) this linker was
 not configured to use sysroots
In-Reply-To: <8B32C9F6FB7E4B6EA47B95D0CD2BAE8D@apexjs>
References: <8B32C9F6FB7E4B6EA47B95D0CD2BAE8D@apexjs>
Message-ID: <20100519121617.572d5752@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 May 2010 11:17:38 +0200
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> I checked the my config and i do use the --sysroot.
> I think the build is using the ld on my host, not the one build by
> buildroot. (see end of log )
> (i have the same problem with QT 4.5.3 
>  
> Is there something missing in the makefile ?

Can you post your Buildroot .config so that we can reproduce the
problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
