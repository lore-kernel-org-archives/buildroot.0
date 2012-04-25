From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 25 Apr 2012 16:18:23 +0200
Subject: [Buildroot] [Bug 5138] New: Add dropbear config option to allow
 blank passwords
In-Reply-To: <bug-5138-163@https.bugs.busybox.net/>
References: <bug-5138-163@https.bugs.busybox.net/>
Message-ID: <20120425141823.GB20601@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13:38 Wed 25 Apr     , bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=5138
> 
>            Summary: Add dropbear config option to allow blank passwords
>            Product: buildroot
>            Version: unspecified
>           Platform: All
>         OS/Version: Linux
>             Status: NEW
>           Severity: enhancement
>           Priority: P5
>          Component: Other
>         AssignedTo: unassigned at buildroot.uclibc.org
>         ReportedBy: grant.b.edwards at gmail.com
>                 CC: buildroot at uclibc.org
>    Estimated Hours: 0.0
> 
> 
> Created attachment 4292
>   --> https://bugs.busybox.net/attachment.cgi?id=4292
> Patch to add dropbear config option to allow blank passwords
> 
> Add a configuration option to allow enabling dropbear's ALLOW_BLANK_PASSWORD
> feature.
this is a security issue

I prefer to add an option to add a default ssh public key

I've a patch somewhere

Best Regards,
J.
