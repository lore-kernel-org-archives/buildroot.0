From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 17:44:35 +0100
Subject: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image
 script.
In-Reply-To: <trinity-ad333bae-0cfc-4733-89ea-5e4eba0cecae-1512316455334@3c-app-mailcom-bs06>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-6-daggs@gmx.com>
 <20171203143102.2e05f11b@windsurf.lan>
 <trinity-ad333bae-0cfc-4733-89ea-5e4eba0cecae-1512316455334@3c-app-mailcom-bs06>
Message-ID: <20171203174435.4c1f643f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Dec 2017 16:54:15 +0100, daggs wrote:

> > Downloading and building stuff in the post-image script is clearly not
> > good. It works around the download and legal-info mechanisms of
> > Buildroot.  
> the fw is part of the vendor's uboot branch, I'm not sure it is a wise idea to add the vendor's uboot as pkg and rename it to something else.
> I'm open for suggestions.

You could add a package like odroid-boot-firmware (or a more
appropriate name), that only installs those firmware files.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
