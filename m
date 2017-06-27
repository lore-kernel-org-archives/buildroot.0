From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Jun 2017 21:15:57 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio: bump version to 10.0
In-Reply-To: <ku292ex3r1.ln2@ID-313208.user.individual.net>
References: <20170626222558.20574-1-ps.report@gmx.net>
 <ku292ex3r1.ln2@ID-313208.user.individual.net>
Message-ID: <20170627211557.76aa88e6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,


On Tue, 27 Jun 2017 06:19:00 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Tue, 27 Jun 2017 00:25:58 +0200 schrieb Peter Seiderer:
> 
> > ToDo/FollowUp: pulseaudio uses now a built-in json parser (see [2]),
> > drop the json-c (and maybe the BR2_TOOLCHAIN_HAS_SYNC_4) dependency.
> 
> Hi Peter,
> 
> in http://patchwork.ozlabs.org/patch/718184/ I tried that but the 

Ups, missed your patch, sorry for the noise...

> configure logic of pulseaudio seems not to be an easy one. Can you help 
> here?

Did take a quick look today at it...yes seems tricky, no quick solution
from my side...

Regards,
Peter

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
