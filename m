From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 11:38:20 +0200
Subject: [Buildroot] [PATCH] ncurses: Add libcurses symlink to libncurses
In-Reply-To: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140923113820.1e06567e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 23 Sep 2014 10:33:11 +0100, Vicente Olivert Riera wrote:
> Some packages use -lcurses when they are linking, so they try to link to
> a library called libcurses. The library provided by our ncurses package
> is called libncurses, so those packages fail to link with a message like
> this one:

Can you define "some" in "Some packages" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
