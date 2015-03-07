From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 15:56:34 +0100
Subject: [Buildroot] [PATCH V2 1/2] tcl: add support for static builds
In-Reply-To: <54FB0B22.8050604@imgtec.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150307144233.5ee1db01@free-electrons.com>
 <54FB0B22.8050604@imgtec.com>
Message-ID: <20150307155634.605f5a68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 7 Mar 2015 15:28:50 +0100, Vicente Olivert Riera wrote:

> I guess you could need tcl to build something that depends on it, and
> link against libtcl8.6.a, for instance.

If you need tcl to build something, then it's the host tcl, not the
target tcl.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
