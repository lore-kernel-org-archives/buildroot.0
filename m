From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 11 May 2011 11:07:26 -0500
Subject: [Buildroot] [Bug 3703] New: Consider using /usr/bin/env bash in
	scripts
In-Reply-To: <bug-3703-163@https.bugs.busybox.net/>
References: <bug-3703-163@https.bugs.busybox.net/>
Message-ID: <201105111107.35067.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed May 11 2011, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=3703
> 
>            Summary: Consider using /usr/bin/env bash in scripts
>            Product: buildroot
>            Version: unspecified
>           Platform: PC
>         OS/Version: Linux
>             Status: NEW
>           Severity: minor
>           Priority: P5
>          Component: Other
>         AssignedTo: unassigned at buildroot.uclibc.org
>         ReportedBy: holger+br at freyther.de
>                 CC: buildroot at uclibc.org
>    Estimated Hours: 0.0
> 
> 
> On FreeBSD bash will not be inside /bin/bash but will be in
> /usr/local/bin/bash, by using /usr/bin/env bash one can have a script that
> works well with a Linux system and FreeBSD.
> 

When did Build Root start building FreeBSD systems?
I must have missed that memo.

Mike
