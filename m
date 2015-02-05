From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 14:20:15 +0100
Subject: [Buildroot] grub2 failure with gcc-4.9
In-Reply-To: <54D367F9.4060108@free.fr>
References: <54D367F9.4060108@free.fr>
Message-ID: <20150205142015.4318baa2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 05 Feb 2015 13:54:17 +0100, Thierry Bultel wrote:

> After some (printf) debugging, I found out that when 'loading' the 
> builtin modules at startup, some modules names are corrupted.
> I am about to get into deeper investigation, but has anyone
> encountered it ?

Interesting.

First suggestions:

 - try with another gcc 4.9 toolchain (distro toolchain or something)

 - try with different optimization levels (default of Buildroot is -Os,
   try with -O0 and -O2)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
