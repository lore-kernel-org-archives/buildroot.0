From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 19:35:34 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <CA+TH9Vm556YroUf1zQWbaRRb63ruDLWpK5RjpTxZhUpvXKn9Xw@mail.gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
 <20141102225411.0fe3d3de@free-electrons.com>
 <CA+TH9VmVC8N2-k_mUvf8b_gtMyXk+cgw0Wv+2Z0sM=+1SdVfRQ@mail.gmail.com>
 <CA+TH9Vm2PPd7WaTdtK0u_PF=sxhtFn=ztqMrtedT4z_mFXMPzw@mail.gmail.com>
 <CA+TH9Vm556YroUf1zQWbaRRb63ruDLWpK5RjpTxZhUpvXKn9Xw@mail.gmail.com>
Message-ID: <20141125193534.00c099d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 3 Nov 2014 11:33:05 +0100, Angelo Compagnucci wrote:

> > So if you like this way, I'll update variables.less and
> > bootswatch.less to bootstrap 3.2, then I'll recompile bootstrap, then
> > I'll send you a zip with new files to overcome smtp problems with very
> > long lines.
> 
> Attached you can find (in tar.gz format) the patch that updates
> bootstrap, theme, and source file to re-create the bootstrap.min.css
> file.

Unfortunately it still doesn't apply on top of the latest master:

thomas at skate:~/projets/buildroot (master)$ LANG=C git am -s /tmp/0001-docs-RWD-website-upgrading-bootswatch-theme-file.patch
Applying: docs: RWD website - upgrading bootswatch theme file
/home/thomas/projets/buildroot/.git/rebase-apply/patch:1659: trailing whitespace.
  
error: patch failed: docs/css/bootstrap.min.css:1
error: docs/css/bootstrap.min.css: patch does not apply
Patch failed at 0001 docs: RWD website - upgrading bootswatch theme file
The copy of the patch that failed is found in:
   /home/thomas/projets/buildroot/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
