From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:33:55 +0200
Subject: [Buildroot] [PATCH v3 1/1] webkitgtk: Add patches which allow
 building for ARMv8-A
In-Reply-To: <20170729153146.47c90404@windsurf.lan>
References: <20170729131639.28156-1-aperez@igalia.com>
 <20170729153146.47c90404@windsurf.lan>
Message-ID: <20170729153355.176797cd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 15:31:46 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 29 Jul 2017 16:16:39 +0300, Adrian Perez de Castro wrote:
> > The two added patches allow building WebKitGTK+ when the compiler
> > scpecifically targets ARMv8-A, and reports as such be pre-defining
> > __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
> > pulled from the corresponding upstream bug reports and edited to
> > remove the conflicting parts which edit the ChangeLog files.  
> 
> You did not remove the parts that edit the ChangeLog files it seems,
> and therefore, those patches don't apply to webkitgtk. There is no
> Source/WTF/ChangeLog file in the extracted tarball:

Sorry, you sent a v3, and I had applied your v2... but replied to your
v3.

Your v3 looks good, I'll apply.

Sorry for the noise :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
