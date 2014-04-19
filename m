From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 14:06:21 +0200
Subject: [Buildroot] [PATCH 1/1] libsoxr: new package
In-Reply-To: <535254BA.9060004@gmail.com>
References: <1397867553-7107-1-git-send-email-hadrien.boutteville@gmail.com>
 <20140419095242.4f405cdd@skate> <535254BA.9060004@gmail.com>
Message-ID: <20140419140621.27e4f589@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Sat, 19 Apr 2014 12:49:30 +0200, Hadrien Boutteville wrote:

> I packaged it with minimal toolchain configuration and checked for these
> cases, it built fine. I rebuilt with your configurations and it is
> always good.

Good.

> At first glance the threads references in the code depend on OpenMP, and
> I disabled it.
> 
> I don't have time today to test the execution with static library and no
> thread, I just tested with a standard ARM configuration.

That's ok.


> > The project apparently provides a tarball. Could you use the tarball
> > instead of the Git repository?
> 
> OK. Is it better to always use the tarball if available?

Yes. It's typically faster to download, and git:// access can be
problematic in some companies that have stupid firewall/proxy policies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
