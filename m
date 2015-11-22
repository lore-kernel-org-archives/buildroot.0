From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 01:17:37 +0100
Subject: [Buildroot] [PATCH] bullet: disable on microblaze
In-Reply-To: <CANu7NGuTHtfww8cuxTfmFUYQBkN8bbp3d6SuxQg9NRt2gxL9xw@mail.gmail.com>
References: <1448140207-28861-1-git-send-email-arnout@mind.be>
 <CANu7NGuTHtfww8cuxTfmFUYQBkN8bbp3d6SuxQg9NRt2gxL9xw@mail.gmail.com>
Message-ID: <565109A1.3070108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 22:31, Sergio Prado wrote:
> Dear Arnout,
> 
> I'm looking at a related bug in the gpsd package
> (https://bugs.busybox.net/show_bug.cgi?id=6872) and preparing a patch for it. in
> my case, looks like it is just a matter of disabling -fexpensive-optimizations.
> That way we can keep compiling the package for the microblaze architecture.
> 
> I can make some tests in the bullet package if you want.


 Yeah, good plan.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
