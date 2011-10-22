From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 22 Oct 2011 19:04:48 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111021154303.43f98ccd@skate>
References: <20111017184718.71afc290@skate>
	<20111021154303.43f98ccd@skate>
Message-ID: <CAAXf6LWuoZu8qv6XHNyD-Ch=gEZPSCOvb6UC7615LiF+PrriCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 21, 2011 at 3:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 17 Oct 2011 18:47:18 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> The current (unfinished) status of my slides is visible at:
>> ? http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
>
> First of all, I'd like to thank Peter, Baruch, Thomas, Arnout and Will
> who gave some useful comments about my slides.
>
> At the same URL above, I have published a new version, which hopefully
> addresses your comments, and also adds some more slides on various
> topics. The slides should now, at least in terms of contents, represent
> what I had in mind for this talk.
>
> Now, if you're still willing to spend some time on this, I'd like to
> have comments on:
> ?* remaining english typos, wording improvements, etc.
> ?* suggestions of additional contents/topics if there is something I
> ? missed. Like if you use best practices that aren't described in
> ? those slides.

p4: s/build a kernel image/a kernel image/   (the 'build' is already
mentioned in the header)
p4: for symmetry reasons, I would suggest to start the last point also
with 'It builds' instead of 'Builds'
p4: the 'composed of Busybox' seems odd to me, because 'Busybox' is
one item. Maybe a native English speaker (Will?) can give feedback on
this. Suggestions from me are 'containing Busybox' or 'based on
Busybox'.

p4/5 title: on page 4 there is a question mark, not so on page 5.

p5: I'm unsure what you're trying to say with 'Standard languages
used'. If you refer to make, that was already covered on the previous
slide and may be redundant here.

p5: you're mainly typing full sentences, which is good IMO. But the
'Need to do complete rebuilds' is not consistent with that. I'd
suggest 'You need to ...'.

p10/11: reminder: still lists a TODO about build time

p12: s/more choice/more choices/    (at least, that's my feeling)
p12: first bullet says: "Buildroot complete rebuild", second says:
"complete Buildroot rebuild". This should be consistent. I prefer the
second one.

p24: s/Creating/Create/
p31: s/Mouting/Mounting/



Thanks for the credit, and:
Great job!

Best regards,
Thomas
