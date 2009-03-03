From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Tue, 3 Mar 2009 09:10:12 -0800
Subject: [Buildroot] Sending Patches, Updates Etc.
Message-ID: <D61182AC8012EA4EBC531B3AF23BE109769AC1@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Someone please advise me regarding the preferred approach, guidelines,
etc. to submitting changes, updates, etc.  Many months back, I submitted
a patch to mkcramfs and it never made it in.  I'd like to resubmit it
and other changes for consideration.  Also, I have modified the
menuconfig/config utility so that the "source" command's filespec uses
'glob' to handle wildcards, e.g. like...

  source "package/*/Config.in"

...and I have a few other ideas, I'd like to discuss in relation to
this.  

Do I need to open a bug report first, then submit a patch?

Has anyone considered setting up a patchwork web for buildroot, uclibc
and busybox projects?

Regards,

Darcy
