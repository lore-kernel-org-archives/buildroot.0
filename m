From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 20:50:36 +0100
Subject: [Buildroot] [PATCH v1 1/4] directfb: bump version to 1.7.7
Message-ID: <trinity-852d3963-038d-4f72-af76-b69c57add69c-1425066635930@3capp-gmx-bs23>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, Feb 26, 2015 at 10:35:32PM +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
>  > Remove 0003-remove-redefinition-of-__typeof__.patch (the only upstream
>  > committed patch).
> 
> Thanks, but please merge the patch bumping the version with the one
> adding the hash file as well.
> 

O.k., will do...

> Are you sure no other changes are needed? From the NEWS file I see:
> 
> 1.7.0
> -----
> Major new feature:
> 
> - task-manager (must be enabled explicitly)
> 
>   The task manager allows to automatically distribute rendering tasks over
>   multiple cpu and/or gpu cores. There is an implementation for the generic
>   (software) driver which can be configured with by setting software-cores=<n>
>   and task-manager options in the directfbrc.
>

As I understand this, it is a config file/runtime option, no compile time option...
 
> Merged Projects:
> - DirectFB-extra (missing bits)
> - SaWMan
> - FusionDale
> - FusionSound
> - DiVine
> - ++dfb
> 
> So I was expecting to see an option to enable the task manager support
> and dropping of the sawman package?
> 

O.k, will check all options, will maybe take some time...

Regards,
Peter

> -- 
> Bye, Peter Korsgaard
