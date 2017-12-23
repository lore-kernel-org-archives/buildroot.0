From: daggs <daggs@gmx.com>
Date: Sat, 23 Dec 2017 09:32:10 +0100
Subject: [Buildroot] tvheadend doesn't list existing DVB adapter
In-Reply-To: <aq9igexsnk.ln2@ID-313208.user.individual.net>
References: <trinity-147f354a-6383-4635-b92c-9f49f94ac11c-1513517470581@3c-app-mailcom-bs10>
 <aq9igexsnk.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-7f9b271e-e8b5-445e-8c19-e90ae6d51977-1514017930082@3c-app-mailcom-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Am Sun, 17 Dec 2017 14:31:10 +0100 schrieb daggs:
> 
> > Greetings,
> > 
> > I've built a buildroot based image updated for today with uclubc-ng as
> > libc.
> > when I boot the image on my rpi2 and access tvheadend;'s webgui, I don't
> > see any adapter. there is one one the system, see:
> 
> Hi,
> 
> anything interesting in the tvheadend log?
> Your problem does not sound buildroot-specific, please open a ticket 
> upstream: https://tvheadend.org/projects/tvheadend/issues
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
with glibc I see the same issue.
nothing in the log
my bulldroot config is here: https://paste.pound-python.org/show/xIVRJeRAJQWukvLbFmmX/ can to take a quick look and see if there is something off with the config?

Dagg.
