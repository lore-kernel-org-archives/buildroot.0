From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 14:49:58 +0100
Subject: [Buildroot] php-cgi not executing .php-file
In-Reply-To: <482796e5cb84cdce7db36b558eaadb38@webmail-alfa3071.alfahosting-server.de>
References: <4318ea066b1d4331be3d63f7f2357bad@webmail-alfa3071.alfahosting-server.de>
 <20150310135111.7c67cad4@free-electrons.com>
 <482796e5cb84cdce7db36b558eaadb38@webmail-alfa3071.alfahosting-server.de>
Message-ID: <20150310144958.1fe74b9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Erichsen,

Please do not reply to me directly, keep the list in Cc so that the
discussion remains public. Thanks!

On Tue, 10 Mar 2015 14:34:46 +0100, Jan Erichsen wrote:

> Thank you Thomas for your response, 
> 
> i am using "nios2-linux-gnu-gcc" witch is prebuild and located at
> "/nisos2-linux/toolchain-mmu/x86-linux2/bin" and comes from the Tarball.

Can you try with the CodeSourcery NIOS II toolchain that is
pre-configured in Buildroot ? Just to rule out any toolchain issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
