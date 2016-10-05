From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Oct 2016 00:26:26 +0200
Subject: [Buildroot] Next Buildroot Developers Meeting approaching
In-Reply-To: <20161003234044.55b98568@free-electrons.com>
References: <20161003234044.55b98568@free-electrons.com>
Message-ID: <b385be1d-a433-331d-2d52-720b18bf43f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-10-16 23:40, Thomas Petazzoni wrote:
> Hello,
> 
> Our next Buildroot Developers Meeting will take place on October 14-16
> in Berlin, so the date is approaching.

 I'm happy to announce that Mind will sponsor the Friday night dinner.

 We would still like a sponsor for the location, and it would also be nice if we
could get T-shirts for the participants. So if you think your employer would be
willing, please get in touch!


> We know have 10 participants registered: 8 attending all three days, 1
> attending only 2 days, and one attending only one day.
> 
> More details:
> 
>   http://elinux.org/Buildroot:DeveloperDaysELCE2016
> 
> It's time to think about discussion and development topics. Even
> contributors not attending the meeting can suggest some topics. During
> the meeting we will be available on IRC and can organize live Google
> Hangout discussions with remote participants if there is interest.
> 
> On my side, I think I'd like to spend a significant part of the 3 days
> working on the testing infrastructure. But to do so, I'd like to team
> up with someone present during the Developers Meeting. If someone is
> interested, let me know.

 I'm interested!

 I think there are in fact three completely different testing enhancements we
should consider:

1. Run-time testing, e.g. of the autobuilder artefacts.

2. Feature testing of Buildroot features, like BR2_EXTERNAL, umask handling,
graph-depends, etc.

3. Extending the existing autobuilders with kernel and bootloader builds.

 I guess you would concentrate on 1. I would love to work on 2, but I'm not so
efficient so perhaps my time is better spent on reviewing + looking over your
shoulder.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
