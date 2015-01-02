From: Ernest L Williams <ernesto@slac.stanford.edu>
Date: Thu, 1 Jan 2015 21:03:07 -0800
Subject: [Buildroot] Newbie: configure: error: cannot run test program while
	cross compiling
Message-ID: <54A6268B.5050603@slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I am working with the hdf5 package and having trouble getting past the 
configuration stage :(
hdf5 builds fine for my host machine but fails configuration when i try 
to build for
"x86_64-buildroot-linux-uclibc"


Oops,
package/pkg-generic.mk:172: recipe for target 
'/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_configured' 
failed

The hdf5 package uses autotools

Any ideas on what I should pursue?

By the way,  why does "package/pkg-generic.mk" show up in the output below?
I am using auto-tools.


checking if libtool needs -no-undefined flag to build shared libraries... no
checking if configure should try to set up large file support... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking if large (64-bit) files are supported on this system.... 
configure: error: in 
`/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14':
configure: error: cannot run test program while cross compiling
See `config.log' for more details
package/pkg-generic.mk:172: recipe for target 
'/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_configured' 
failed
make: *** 
[/home/ernesto/packages/buildroot-2014.11/buildroot-uclibc-x86_64/output/build/hdf5-1.8.14/.stamp_configured] 
Error 1
[ernesto at localhost buildroot-uclibc-x86_64]$

Cheers,
Ernesto
