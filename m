From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Oct 2013 21:55:42 +0200
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131015093444.4ef3fa17@skate>
References: <20131014113000.73ca82bf@skate>
 <1642454622.8785613.1381743494806.JavaMail.root@openwide.fr>
 <CAAXf6LX7cHRZyGcA5KgYaL7iUuw_JhBxTAzsWrptAa9y10353w@mail.gmail.com>
 <525C6845.50803@mind.be> <20131015093444.4ef3fa17@skate>
Message-ID: <525D9DBE.7040802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/13 09:34, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 14 Oct 2013 23:55:17 +0200, Arnout Vandecappelle wrote:
>
>>> What I wanted to add in this discussion is this: if there are people
>>> out there that have time for some buildroot development but they have
>>> no clear goal of their own, they can among others choose between
>>> package bumps and fixing autobuild failures.
>>> While there certainly is value in package bumping, I hope that not all
>>> of these people jump onto the bump-train and instead help with the
>>> autobuild failures. We still hope to get to 0 failures at some point,
>>> and bumping packages all the time will most of the time only add new
>>> problems.
>>
>>    I'm also not too hot on version bumping just for the sake of bumping.
>> Version bumps should be done when they're useful for someone, e.g.
>> because a feature or bugfix is added. If it's useful to you, then you'll
>> obviously test if it still works correctly.
>
> I understand this point of view, but on the other hand, it's not really
> nice to have packages that have very old versions. For "core" stuff
> that isn't necessarily very easy to bump (think Qt, Gtk, X.org and
> things like that), it's quite important that the core Buildroot
> community keeps that up to date, because this is difficult to do for
> newcomers, and this is what people will look at to see if Buildroot is
> well-maintained and active.

  Yes of course. The version detection idea is certainly useful. I just 
wanted to concur with Thomas DS that this shouldn't distract people from 
fixing autobuilder failures.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
