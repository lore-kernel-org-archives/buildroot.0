From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 09:12:24 +1300
Subject: [Buildroot] [2/5] libselinux: bump version to 2.6
In-Reply-To: <1485263338.2005.10.camel@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
 <20170109161523.6855-2-aduskett@codeblue.com>
 <20170124233039.1f0813e9@free-electrons.com>
 <1485263338.2005.10.camel@codeblue.com>
Message-ID: <20170125091224.6eb5b0a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 13:08:59 +0000, Adam Duskett wrote:

> What C library are you using?  I am using glibc and it compiles without
> any issue.  

The C library of the target system doesn't matter: what fails to build
is host-libselinux, i.e a host package.

So it seems like to be that there is an issue with the old Debian
system I'm using on my autobuilder instance (which is where I did the
test build).

I'll try to have a closer look and see if I can understand what's going
on, since you apparently can't reproduce it on a different host system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
