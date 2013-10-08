From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 10:20:42 +0200
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static linking issue with
 libpcre
In-Reply-To: <93031320.8180859.1381219933227.JavaMail.root@openwide.fr>
References: <52532B99.20204@mind.be>
 <93031320.8180859.1381219933227.JavaMail.root@openwide.fr>
Message-ID: <20131008102042.3a938439@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 8 Oct 2013 10:12:13 +0200 (CEST), Romain Naour wrote:

> Also, Gentoo seems to have a patch for this problem.
> http://ftp.eenet.ee/gentoo-portage/net-analyzer/ngrep/files/ngrep-1.45.patch
> 
> Maybe just patch Makefile.in to add -lpcre beside -lpcap ?

Or use pkg-config to get the proper list of libraries.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
