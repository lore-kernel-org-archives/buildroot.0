From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 06 Aug 2014 10:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: Added staging
In-Reply-To: <CAFfn7Uk7k+q1QxhOteqy_NT+4-cPYN8UMRi1wP7ASi4_RVi2Tw@mail.gmail.com>
References: <1407311713-30045-1-git-send-email-pieter.degendt@gmail.com>
 <fb1133f6-4157-4458-9fb4-ede779eb6dea@email.android.com>
 <CAFfn7Uk7k+q1QxhOteqy_NT+4-cPYN8UMRi1wP7ASi4_RVi2Tw@mail.gmail.com>
Message-ID: <c70f3b3c-8ff0-4237-8633-9d893a935eb9@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Please don't top post)

Pieter De Gendt <pieter.degendt@gmail.com> schreef:
>No, I'm just not that familiar yet with the makefile mechanism, I looked at
>other packages for examples, this seemed to be the easiest solution.

I think you should try using the same kind of rule as the INSTALL_TARGET_CMDS, and see if the right files are installed...
This is more future proof...

Best regards,
Thomas
