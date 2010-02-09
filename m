From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2010 13:37:25 +0100
Subject: [Buildroot] [PATCH 04/14] package: added lirc
In-Reply-To: <4d28d4b51002090354r251fd6bfk5e08ccf9cd460baa@mail.gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-5-git-send-email-llandwerlin@gmail.com>
	<20100209123756.78a62141@surf>
	<4d28d4b51002090354r251fd6bfk5e08ccf9cd460baa@mail.gmail.com>
Message-ID: <20100209133725.53f97148@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Feb 2010 12:54:45 +0100
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> > What is the policy regarding installation to the $(STAGING_DIR)
> > directory for applications ? Some of them say
> > FOO_INSTALL_STAGING=NO, some others FOO_INSTALL_STAGING=YES.
> 
> I usually install libraries in staging, not binaries.

So in this case, lirc contains only applications, so it shouldn't be
installed to STAGING, no ?

> Why do you need unstripped binaries ? Are you doing remote debug
> using the staging directory ?

Yes, this is also what the staging directory is for. In the future, we
will try if compiling by default all libraries/applications with
debugging symbols in the $(STAGING_DIR) is doable.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
