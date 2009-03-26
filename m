From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Thu, 26 Mar 2009 16:12:15 +0100
Subject: [Buildroot] Change buildroot directory path
Message-ID: <20090326151215.GA28645@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have one working buildroot config with a port for my specific board. I
want to clean this buildroot diretory from all binaries/dowloaded files
etc and then move the directory to another path (not deep down in my
home directory). I thought that would be easy but unfortunately no... 

I have tried to manually clean the buildroot directory from created
stuff and just update the absolute paths in the configuration files for
platform/busybox/uclibc/linux26 and a bunch of other stuff. The result
is always the same, I get a image that is not 100% working. Usually the
problem is that insmod/modprobe isn't working on target with the error:

xxx: no symbol version for struct_module
insmod: cannot insert 'xxx.ko': invalid module format

What is the normal way to just extract the configuration from a
buildroot directory and move it?

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
