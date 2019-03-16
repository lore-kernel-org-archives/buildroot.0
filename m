From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 16 Mar 2019 22:55:31 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: add webrtcbin
 option
In-Reply-To: <20190314085445.7be54f55@windsurf>
References: <20190310175109.13444-1-ps.report@gmx.net>
 <20190312222745.06cf1b34@windsurf>
 <71e0a8c0-0809-e02c-cb29-25b2771202bd@mind.be>
 <20190313201733.5ac6fb18@gmx.net>
 <25dda2d4-51f8-b20f-9dcd-32584bb0f194@mind.be>
 <20190314085445.7be54f55@windsurf>
Message-ID: <20190316225531.1eee0726@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Thomas,

On Thu, 14 Mar 2019 08:54:45 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 14 Mar 2019 08:27:56 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> >  The Config.in option was introduced in 2017.02, and renamed for 2017.08.
> > 
> >  However, the rename was also backported to 2017.02.4.
> > 
> >  In other words, the only people who could be hit by this issue are people that
> > used 2017.02 and never upgraded even to 2017.02.4.
> > 
> >  I think it's OK if we risk breaking something for those people. Especially
> > because the problem is very obvious and very easy to fix.  
> 
> Yes, I agree: I believe it's better to have the right name for the
> option moving forward, and the problem with re-using the name of the
> previous option is not too bad.
> 
> So, I'm happy to see that both of us agree on the direction to take
> with this.

To both: thanks for review and advice, updated patch follows...

Regards,
Peter

> 
> Thanks
> 
> Thomas
