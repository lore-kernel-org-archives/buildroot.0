From: Johnny Beardsmore <jny0@hotmail.com>
Date: Tue, 14 Dec 2010 09:28:16 +0000
Subject: [Buildroot] ssh-copy-id
In-Reply-To: <20101213174615.491fdba7@surf>
References: <SNT119-W63CFD1FA0F757DC16BC53C82120@phx.gbl>,
	<20101213174615.491fdba7@surf>
Message-ID: <SNT119-W22D09D75AD75F3A79A77D082130@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Many thanks for the response.  I've now built the system with sss-copy-id.  After copying it to the target, and trying to use it, I get:

ERROR: No identities found

I know the target has a key pair, as I've just used ssh-keygen.  Any ideas what could be causing this?

> Date: Mon, 13 Dec 2010 17:46:15 +0100
> From: thomas.petazzoni at free-electrons.com
> To: jny0 at hotmail.com
> CC: buildroot at busybox.net
> Subject: Re: [Buildroot] ssh-copy-id
> 
> On Mon, 13 Dec 2010 10:07:44 +0000
> Johnny Beardsmore <jny0@hotmail.com> wrote:
> 
> > Is there a ssh-copy-id option in Buildroot?  If so, where is it?
> 
> It is part of OpenSSH, which is packaged in Networking applications ->
> openssh in Buildroot.
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/c2787225/attachment.html>
