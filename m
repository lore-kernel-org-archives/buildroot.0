From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Thu, 4 Apr 2013 19:03:07 +0000
Subject: [Buildroot] [PATCH] Install DTB as part of images install
 command
In-Reply-To: <515D6627.7000803@mind.be>
References: <069B5A25F9844945B625ADE7258AC94C06204FCC@4rf-nz-orion.local.4rf.com>
 <515D6009.5010306@mind.be> <515D6627.7000803@mind.be>
Message-ID: <069B5A25F9844945B625ADE7258AC94C06205782@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about that. It looks like my corporate mail server has replaced the tabs with spaces when it inserted the corporate warning. The email in my sent items definitely had the tabs. I will try and figure a better way to send it.

Reuben

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Friday, 5 April 2013 12:38 a.m.
> To: Arnout Vandecappelle
> Cc: Reuben Dowle; buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] Install DTB as part of images install
> command
>
> On 04/04/13 13:12, Arnout Vandecappelle wrote:
> >>
> >>   define LINUX_INSTALL_IMAGES_CMDS
> >>          cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> >> +       $(LINUX_INSTALL_DTB)
> >
> >   I prefer the indentation to be with a tab, but since the original
> has
> > spaces it's OK.
>
>   Scratch that, the patch is whitespace-modified and doesn't apply (the
> original _does_ have tabs). Could you resend with git send-email?
>
>   Regards,
>   Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
