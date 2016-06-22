From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jun 2016 17:13:17 +0200
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
Message-ID: <20160622171317.79fbea7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 12:02:15 -0300, Gustavo Zacarias wrote:
> On 2016-06-22 11:53, Peter Korsgaard wrote:
> 
> > Why? In the past we have defaulted to latest-1 and 2.24 isn't released
> > yet.  
> 
> Why not?

Default to n-1 has been our tradition for gcc/binutils/glibc for ages.

> We're using latest uclibc-ng if it's suitable/for example.

Cause uclibc-ng doesn't evolve much beyond bug fixes at the moment, so
there's not really a good reason to not use the latest version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
