From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Oct 2013 23:55:17 +0200
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <CAAXf6LX7cHRZyGcA5KgYaL7iUuw_JhBxTAzsWrptAa9y10353w@mail.gmail.com>
References: <20131014113000.73ca82bf@skate>
 <1642454622.8785613.1381743494806.JavaMail.root@openwide.fr>
 <CAAXf6LX7cHRZyGcA5KgYaL7iUuw_JhBxTAzsWrptAa9y10353w@mail.gmail.com>
Message-ID: <525C6845.50803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/13 12:02, Thomas De Schampheleire wrote:
> On Mon, Oct 14, 2013 at 11:38 AM, Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:
> [..]
>>
>> yeah, that's the "might not be a good idea" part... I was more thinking
>> on the line of "this is a minor release and it compiles correctly, it's
>> probably an easy job to test and bump" i.e for the case of minor/security
>> releases upstream. It's a balance between helping maintainers work fast,
>> helping project managers see low hanging fruites and making sure people
>> are not too lazy...
>>
> [..]
>
> What I wanted to add in this discussion is this: if there are people
> out there that have time for some buildroot development but they have
> no clear goal of their own, they can among others choose between
> package bumps and fixing autobuild failures.
> While there certainly is value in package bumping, I hope that not all
> of these people jump onto the bump-train and instead help with the
> autobuild failures. We still hope to get to 0 failures at some point,
> and bumping packages all the time will most of the time only add new
> problems.

  I'm also not too hot on version bumping just for the sake of bumping. 
Version bumps should be done when they're useful for someone, e.g. 
because a feature or bugfix is added. If it's useful to you, then you'll 
obviously test if it still works correctly.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
