From: Rafael A Barrero <rafa@linux.it>
Date: Wed, 29 Nov 2006 02:13:11 +0100 (CET)
Subject: [Buildroot] new DHCP version and make error
In-Reply-To: <1164758347.4016.24.camel@dv>
References: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
	<25387.206.190.75.8.1164749926.squirrel@picard.linux.it>
	<1164752891.4016.9.camel@dv>
	<9d921c5e52578b674eefe0f12a073f9d@bowery.com>
	<1164758347.4016.24.camel@dv>
Message-ID: <49328.206.190.75.8.1164762791.squirrel@picard.linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

I agree that buildroot should take step forward in this direction. A
"distribution building system" should be able to maintain a stable process
for creating these distributions, no?

I for example have just begun to work with buildroot and I'm coming across
missing software distributions or software distributions that simply do
not compile.

For example - gettext-0.14.6 does not compile... what do you guys suggest?
Do I remove it from my list? Use an alternate version? Fix the bug?

Does anyone have a known-good list somewhere (for x86 targets)? What
versions allow buildroot to compile cleanly? Completely?

I certainly don't mind pitching a hand... I've got some spare systems and
could put together a quick test matrix. Thoughts?

Thanks,

Rafael.

> On Tue, 2006-11-28 at 17:37 -0500, Marc Lindahl wrote:
>> On Nov 28, 2006, at 5:28 PM, Pavel Roskin wrote:
>> > I'd like to see buildroot become a distribution over time.
>>
>> I thought buildroot was a distribution building system, not an actual
>> distribution...
>
> OK, let's call it a distribution building system.  Once Buildroot 1 is
> released and the work starts on Buildroot 2, Buildroot 1 needs to remain
> functional for some time.
>
> It could be updated for security, but updating it just to reflect
> changes on the Web (such as new download locations) would be too much
> work.
>
> Of course, the task of mirroring could be relegated to the creators of
> the specific distributions, but I think the buildroot project shouldn't
> miss an opportunity to become more relevant to the embedded community.
>
> There are cases when stability of the platform is highly desirable.  If
> buildroot itself provides it, we'll see more people dealing with it
> directly rather than through distributions based on some old snapshot.
>
> --
> Regards,
> Pavel Roskin
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
