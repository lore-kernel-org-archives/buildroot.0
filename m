From: daggs <daggs@gmx.com>
Date: Fri, 25 Aug 2017 21:27:27 +0200
Subject: [Buildroot] optimizing a rpi2 env
In-Reply-To: <20170825202842.74f20361@gmx.net>
References: <trinity-2b796612-07b4-4f47-9f17-b1e8706ec437-1503554259955@3c-app-mailcom-bs02>
 <20170825202842.74f20361@gmx.net>
Message-ID: <trinity-4cbd7898-a224-4fea-b8e9-4a25da617883-1503689246987@3c-app-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Hello Dagg,
> 
> On Thu, 24 Aug 2017 07:57:40 +0200, daggs <daggs@gmx.com> wrote:
> 
> > Greetings,
> > 
> > I have a rpi2 that I want to use as a headless local dtv server, e.g. no screen, inputs (beside a dongle).
> > only network, I've built a image with what I need and I wonder how can I optimize the env go no unneeded resorcses will be used? for example, gpu memory.
> 
> Not very buildroot specific questions, more one for the rpi community, but take a
> look at the config.txt file options [1],[2] maybe it helps...
> 
> Regards,
> Peter
> 
> [1] https://www.raspberrypi.org/documentation/configuration/config-txt/
> [2] https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md
> 
> 
> > 
> > Thanks,
> > 
> > Dagg.

yeah, I thought there might be a specific package configuration that can be done with buildroot.
guess I was wrong.
thanks for the links, I'll take a look.

Dagg.
