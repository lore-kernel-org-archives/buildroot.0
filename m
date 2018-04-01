From: daggs <daggs@gmx.com>
Date: Sun, 1 Apr 2018 09:43:00 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <1je6pexo6d.ln2@ID-313208.user.individual.net>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
 <trinity-8edc1929-b40d-4afa-85a8-e152cef642fb-1522567556973@3c-app-mailcom-bs16>
 <1je6pexo6d.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-550783d4-570b-41d5-937b-f66aa367d27f-1522568580265@3c-app-mailcom-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Sent: Sunday, April 01, 2018 at 10:33 AM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
>
> Am Sun, 01 Apr 2018 09:25:57 +0200 schrieb daggs:
> 
> > ok, I understood the second part, the OpenGL ES libraries are part of
> > buildroot, see odroid-mali which uses version r6p1.
> > do you mean that they need to be upgraded?
> 
> Hi daggs,
> 
> how are amlogic and odroid connected to each other? Please forgive me if 
> I am asking stupid questions, but I never used hardware like this for 
> Kodi.
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

odroidc2 boards use amlogic libs, infact I'm the maintainer of the libamlogic pkg and I've added the support to kodi.
if it isn't needed to get hw decoding for kodi, I see no point in having that pkg in buildroot.
afaik, it is needed, e,g, removing that pkg will result in no hw decoding support under kodi for the c2 boards (e.g. no x265) under kodi.

Dagg.

Dagg.
