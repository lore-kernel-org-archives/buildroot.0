From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:46:32 +0200
Subject: [Buildroot] [PATCH] help entries for Init system config menu
In-Reply-To: <20150324202302.GA4645@vostro>
References: <20150324202302.GA4645@vostro>
Message-ID: <20151018234632.2cd5d3a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Tue, 24 Mar 2015 22:23:02 +0200, Alex Suykov wrote:
> Primary focus is on (auto-)respawning and runtime control.
> 
> Systemd entry describes current state, with several daemons
> configured as forking.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

The only feedback received formally on the list on this patch was from
Yann E. Morin, and his feedback was not very positive. We
quickly discussed your patch as the latest Buildroot meeting, and some
people found part of it interesting (such as the parts detailing how in
Buildroot each init system is implemented: rcS + Sxx scripts, etc.),
but that it is not acceptable in this form.

However, this you have never reacted to Yann's feedback, I am not sure
if you are still interested in getting this patch merged. I've marked
it as "Rejected" for now as it isn't acceptable in its current form.

If you're interested in pushing this further, can you reply to Yann's
feedback ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
