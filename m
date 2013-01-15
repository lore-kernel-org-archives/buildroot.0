From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 15 Jan 2013 09:18:14 +0100 (CET)
Subject: [Buildroot] New kernel source mode [Proposal]
In-Reply-To: <20130115085501.52a772cc@skate>
Message-ID: <772dc0cb-8f56-4bd5-8862-8c95ad4457a5@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>      So, for each package, the source code is extracted in
>      output/sources/<pkg>-<version>/, and the build takes places in
>      output/build/<pkg>-<version>/ for target packages, and
>      output/build/host-<pkg>-<version>/ for host packages.
> 

just a small detail but...

could you consider building in output/build/target instead of directly int
output/build/ for the target ?

1) the host/ part won't be hidden in the middle of all sorts of directories that are package specific
2) it would avoid confusion in the case we somday include a utility named "host"

    Regards

    J?r?my Rosen

fight key loggers : write some perl using vim
