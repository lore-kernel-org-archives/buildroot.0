From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 09:07:03 +0200
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <51BFFD16.7030009@mind.be>
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
 <20130616130904.GD3495@free.fr>
 <CAHt8ZCPnR+9SG=rDfyzeLQcbT=UWAwhun4PJ31Ohk=60=0+a7g@mail.gmail.com>
 <20130616183051.GZ16699@lukather> <51BFFD16.7030009@mind.be>
Message-ID: <20130618090703.05d44c80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 18 Jun 2013 08:24:22 +0200, Arnout Vandecappelle wrote:

>   There are just a few daemons that you'd want to run from hotplug, most 
> of them would still run from init.d.
> 
>   But I really would like a better way to manage the services you want to 
> run in init.d, and especially their order. I can't come up with a good 
> solution, though, so I'm not actively complaining :-)

I believe it's typically the kind of customization that is left to the
user, through a post-build script. Buildroot provides a relatively sane
default installation, and the user has to further tweak it if needed. I
don't think we should make Buildroot more complex to allow directly in
the Buildroot configuration this kind of very specific customization.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
