From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 25 Aug 2018 21:37:32 +0200
Subject: [Buildroot] [RFC v3 2/3] openssh: add patch to fix
 openssl-1.1.0h compile
In-Reply-To: <73a75fx6k1.ln2@ID-313208.user.individual.net>
References: <20180508195431.19944-1-ps.report@gmx.net>
 <20180508195431.19944-2-ps.report@gmx.net>
 <73a75fx6k1.ln2@ID-313208.user.individual.net>
Message-ID: <20180825213732.36005e3e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 25 Aug 2018 08:37:59 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Tue, 08 May 2018 21:54:30 +0200 schrieb Peter Seiderer:
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v2 -> v3:
> >   - no changes
> > 
> > Changes v1 -> v2:
> >   - no changes  
> 
> Hi Peter,
> 
> this patch does not apply anymore on openssh-7.8.

Try one of the update versions of derived patch from [1] or [2]...

Regards,
Peter

[1] https://git.archlinux.org/svntogit/packages.git/log/trunk/openssl-1.1.0.patch?h=packages/openssh
[2] https://src.fedoraproject.org/cgit/rpms/openssh.git/log/openssh-7.3p1-openssl-1.1.0.patch

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
