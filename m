From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Tue, 22 Nov 2011 16:11:45 -0600
Subject: [Buildroot] equivalent of a 'make modules'
In-Reply-To: <20111122230429.2bef52c2@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
Message-ID: <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I am working with another program that builds itself against the
>> kernel.  I am using BuildRoot for making the kernel and filesystem.
>> It is believed that the next step would be to do something like a
>> "make modules" command so that the kernel and filesystem can be
>> rebuilt with this other program's information in it.
>
>Can you expand on what this program is ?

EtherCAT.  I think it should have some kernel modules, be built against the
kernel source, etc.  A command like 'make modules_install install' can be
part of building for Linux PC.

Generally what I am doing is building EtherCAT and pointing it to the
buildroot directory for the kernel sources.  Then when EtherCAT build
finishes, I go back into BuildRoot and run make and the filesystem has been
updated.

But when I try and run, I get a modules not found error.  So the thought is
I need to do a make install type of command.

Thanks,



Jeff
