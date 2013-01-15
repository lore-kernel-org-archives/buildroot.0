From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 21:40:53 +0100
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <CAJJ6jxsbtr92TvkAfhz5m_Jxxp1DTA7_cmtnY5NKYMkJFYgHoQ@mail.gmail.com>
 (Steve Calfee's message of "Tue, 15 Jan 2013 10:23:36 -0800")
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
 <CAJJ6jxsbtr92TvkAfhz5m_Jxxp1DTA7_cmtnY5NKYMkJFYgHoQ@mail.gmail.com>
Message-ID: <877gnemb6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

Hi,

 Steve> Hi, I am not opposed to a simple integration of kernel development
 Steve> into buildroot.

 Steve> However, the last time I did kernel hacking a few years ago with
 Steve> buildroot, we just did not build the kernel with BR. The greatly
 Steve> speeds up a BR build after a clean (If you also use an external
 Steve> toolchain).

 Steve> We had the kernel tree in an external git tree where we did standard
 Steve> cross builds using the same compilers used by the BR. A simple script
 Steve> to copy uImage and the modules to the nfs filesystem where BR was
 Steve> extracted made a testable system.

I work somewhat similar. I build the kernel by hand while I'm developing
on it (working on a driver or whatever), and the same for any custom
applications, and only use buildroot as an integration tool once the
individual components are more-or-less stable to ensure everything is
under version control and can be reproduced.

-- 
Bye, Peter Korsgaard
