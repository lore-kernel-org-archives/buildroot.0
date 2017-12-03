From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 19:56:00 +0100
Subject: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image
 script.
In-Reply-To: <20171203174435.4c1f643f@windsurf.home>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-6-daggs@gmx.com>
 <20171203143102.2e05f11b@windsurf.lan>
 <trinity-ad333bae-0cfc-4733-89ea-5e4eba0cecae-1512316455334@3c-app-mailcom-bs06>
 <20171203174435.4c1f643f@windsurf.home>
Message-ID: <trinity-932caa2f-35ff-44af-9c26-11390ac31712-1512327360076@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Sunday, December 03, 2017 at 6:44 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image script.
>
> Hello,
> 
> On Sun, 3 Dec 2017 16:54:15 +0100, daggs wrote:
> 
> > > Downloading and building stuff in the post-image script is clearly not
> > > good. It works around the download and legal-info mechanisms of
> > > Buildroot.  
> > the fw is part of the vendor's uboot branch, I'm not sure it is a wise idea to add the vendor's uboot as pkg and rename it to something else.
> > I'm open for suggestions.
> 
> You could add a package like odroid-boot-firmware (or a more
> appropriate name), that only installs those firmware files.
> 
> Thomas

I'd hoped I'd won't have to do it... well... will check it out.
