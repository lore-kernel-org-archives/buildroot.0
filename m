From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 11:17:33 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540D6ADB.30300@imgtec.com>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
 <540D69A4.4080503@imgtec.com>
 <20140908103445.6a8858b4@free-electrons.com>
 <540D6ADB.30300@imgtec.com>
Message-ID: <20140908111733.1966e641@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Sep 2014 09:37:47 +0100, Vicente Olivert Riera wrote:

> Well, more build logs related to this issue are useless because it's 
> being handled upstream, so, yes, maybe we should disable it for MIPS64 
> n32 until this problem gets fixed.

Well, the issue has been reported upstream in May 2014 according to
what you said, and upstream did react much since then. With Qt5 being
out since quite some time now, I fear that upstream may simply never
fix the bug for Qt4. Which indeed is another reason to disable Qt4 on
MIPS64 n32.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
