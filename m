From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Dec 2010 19:58:27 +0200
Subject: [Buildroot] ssh-copy-id
In-Reply-To: <SNT119-W22D09D75AD75F3A79A77D082130@phx.gbl>
References: <SNT119-W63CFD1FA0F757DC16BC53C82120@phx.gbl>
	<20101213174615.491fdba7@surf>
	<SNT119-W22D09D75AD75F3A79A77D082130@phx.gbl>
Message-ID: <20101214175826.GA11373@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johnny,

On Tue, Dec 14, 2010 at 09:28:16AM +0000, Johnny Beardsmore wrote:
> Many thanks for the response.  I've now built the system with sss-copy-id.  
> After copying it to the target, and trying to use it, I get:
> 
> ERROR: No identities found
>
> I know the target has a key pair, as I've just used ssh-keygen.  Any ideas 
> what could be causing this?

This is not related to Buildroot. However, since ssh-copy-id is just a shell 
script you can try doing 'sh -x /usr/bin/ssh-copy-id user at host' to get more 
info on the script execution.

baruch

> > Date: Mon, 13 Dec 2010 17:46:15 +0100
> > From: thomas.petazzoni at free-electrons.com
> > To: jny0 at hotmail.com
> > CC: buildroot at busybox.net
> > Subject: Re: [Buildroot] ssh-copy-id
> > 
> > On Mon, 13 Dec 2010 10:07:44 +0000
> > Johnny Beardsmore <jny0@hotmail.com> wrote:
> > 
> > > Is there a ssh-copy-id option in Buildroot?  If so, where is it?
> > 
> > It is part of OpenSSH, which is packaged in Networking applications ->
> > openssh in Buildroot.
> > 
> > Thomas

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
