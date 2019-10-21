From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:19:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-entrypoints: new package
In-Reply-To: <CALFsTFUwd1466rkCTu07Cd=iho3kpZoDGUno8L6PiV+UreKxAg@mail.gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-4-asafka7@gmail.com>
 <20191021191328.201217a0@windsurf>
 <CALFsTFUwd1466rkCTu07Cd=iho3kpZoDGUno8L6PiV+UreKxAg@mail.gmail.com>
Message-ID: <20191021211959.2937fa72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Mon, 21 Oct 2019 22:01:27 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Yes, python-entrypoints was sent together with python-keyring.

Together, but mixed with the other patches I supposed ?

> In addition, python-zc-lockfile was sent together with python-cherrypy.
> Moreover, I now noticed that my series of python-snmp-apps with
> snmpclitools earlier
> this month seems to be sent separately too. All the other patches I
> sent are single patches.
> Next time, I'll send the series at the same time.
> Do you need me to resend the existing patches or we'll be fine for that round?

No need to resend.

> > Also, I see you are doing a lot of version bumps for Python packages.
> > Is it related to the fact that you know receive e-mail notifications
> > when Python packages are not up to date ? Are we going to see a point
> > where this stream of patches reduces, or is there just very frequent
> > update of Python modules happening upstream ?
> >  
> 
> Indeed, I updated the packages mostly because of the new e-mail feature with the
> list of outdated packages.
> I guess those many bumps happened since the feature is new and we had
> a lot to do, but I think now we're pretty close to the end, so the
> stream of patches is going to reduce :)

Great :-) In any case, thanks for doing this work!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
