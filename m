From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jun 2017 09:49:44 +0200
Subject: [Buildroot] make Error
In-Reply-To: <CAN=nCKAPW+_Ns40xKCiDmFu+pit8k_nP_onGS9fNwNyxem5KeA@mail.gmail.com>
References: <CAN=nCKAPW+_Ns40xKCiDmFu+pit8k_nP_onGS9fNwNyxem5KeA@mail.gmail.com>
Message-ID: <20170602094944.4dd492eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for your bug report.

On Thu, 1 Jun 2017 23:36:25 +0530, Saurabh Mishra wrote:

> I'm trying to build (*build root-2015.05-rc2) *but when I'm running make
> command its giving error in* /config/host-linux.c:215:43: error:
> 'SSIZE_MAX' was not declared in this scope* , i tried to pass hardcoded
> integer value instead of SSIZE_MAX but that is also not working , your help
> would be appreciated.

The information provided in your e-mail is not sufficient to help you.
We need to have:

 - The last ~100 lines of the build output
 - The full Buildroot .config file

Also, make sure this error is reproducible after doing a full rebuild
(i.e "make clean all"). Please read
http://nightly.buildroot.org/manual.html#full-rebuild.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
