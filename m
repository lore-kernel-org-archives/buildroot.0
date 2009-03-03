From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 03 Mar 2009 15:57:26 -0200
Subject: [Buildroot] Sending Patches, Updates Etc.
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE109769AC1@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE109769AC1@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <49AD6F86.5000708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Darcy Watkins wrote:

> Hello,
> 
> Someone please advise me regarding the preferred approach, guidelines,
> etc. to submitting changes, updates, etc.  Many months back, I submitted
> a patch to mkcramfs and it never made it in.  I'd like to resubmit it
> and other changes for consideration.  Also, I have modified the
> menuconfig/config utility so that the "source" command's filespec uses
> 'glob' to handle wildcards, e.g. like...
> 
>   source "package/*/Config.in"
> 
> ...and I have a few other ideas, I'd like to discuss in relation to
> this.  
> 
> Do I need to open a bug report first, then submit a patch?
> 
> Has anyone considered setting up a patchwork web for buildroot, uclibc
> and busybox projects?
> 
> Regards,
> 
> Darcy

Hi.
https://bugs.busybox.net has the new tracker, i submit patches there
under the "buildroot" product. Some made it in, some are pending (dev
time, interest, my patches being cleaner, ...)
Regards.
