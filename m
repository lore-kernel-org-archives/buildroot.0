From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 21:27:45 +0200
Subject: [Buildroot] New pre-built Buildroot toolchains in the
 autobuilder
In-Reply-To: <573B6673.70203@dawncrow.de>
References: <20160517151217.045c17c4@free-electrons.com>
 <573B6673.70203@dawncrow.de>
Message-ID: <20160517212745.6a4753e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 20:44:03 +0200, Andr? Hentschel wrote:

> Hi, http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv needs an update
> e.g. the line http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config
> that file gives a 404
> that breaks my autobuild task

Thanks for reporting. I've fixed that up.

People running an autobuilder: please check if your autobuild-run
script is still running. If not, please restart it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
