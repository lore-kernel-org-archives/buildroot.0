From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 21:01:10 +0200
Subject: [Buildroot] [PATCH 05/13] perl: add GDBM_File
In-Reply-To: <CAB0FRsuJ8vSgW8My3HzKVG5BDMu7049NtScW6ijbzKbL4sTPLA@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-5-git-send-email-francois.perrad@gadz.org>
 <20120920215953.4d4650fb@skate>
 <CAB0FRsuJ8vSgW8My3HzKVG5BDMu7049NtScW6ijbzKbL4sTPLA@mail.gmail.com>
Message-ID: <20120921210110.40e75e63@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 21 Sep 2012 20:36:45 +0200, Fran?ois Perrad wrote:

> The Configure script is not created by autotools, by a tool named 'metaconfig'.
> So, an option --enable-gdbm is not needed.
> The Configure script detects the include and the lib.
> The parameter libc defines a path with SYSROOT, so, there is not
> confusion with build machine.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
