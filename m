From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 3 Dec 2009 19:06:36 -0600
Subject: [Buildroot] [Bug 769] New: Update configuration menu for MIPS
	target
In-Reply-To: <bug-769-163@https.bugs.busybox.net/>
References: <bug-769-163@https.bugs.busybox.net/>
Message-ID: <200912031906.38721.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed December 2 2009, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=769
> 
>               Host: Any
>             Target: MIPS/MIPSel
>            Summary: Update configuration menu for MIPS target
>            Product: buildroot
>            Version: 2009.11
>           Platform: Other
>                URL: http://morethan.org/bldrt/mips_arch.ods

Reviewed / Revised earlier version;
Added -march= options vs known cores table for gcc-2.95.3 through 4.5.dev.
File at above link updated.

Yuck.  I wonder why nobody tackled this mess before now? ;)

Not too surprising, not only are most of these machines being shipped with
an Aug. 2005 kernel, a compiler is being used that is too old to provide
code generation support specific to the core being used.  Double yuck.

Mike
>         OS/Version: Linux
>             Status: NEW
>           Severity: enhancement
>           Priority: P5
>          Component: Other
>         AssignedTo: minimod at morethan.org
>         ReportedBy: minimod at morethan.org
>                 CC: buildroot at uclibc.org
>    Estimated Hours: 0.0
> 
> 
> The MIPS portion of the configuration menu is outdated
> and does not define the complete set of toolchain options
> for current cores.
> 
> At the above link, the following link and as an attachment
> is the table of information from which the additional
> configuration menu entries will be defined.
> 
> Table 1 shows the relationship between feature names and
> the instruction set.
> 
> Table 2 shows the relationship between core code names
> and features.
> 
> The actual configuration menu patch will follow any day, RSN.
> 
> http://morethan.org/bldrt/mips_arch.ods
> 
> Mikez
> 
> 
