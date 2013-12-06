From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 08:38:28 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove references to
	uninstall commands
In-Reply-To: <20131205233008.06272dd1@skate>
References: <patchbomb.1386240845@argentina>
 <f2f1b59c4cfbf80a1592.1386240846@argentina>
 <52A0F94B.1030600@mind.be> <20131205233008.06272dd1@skate>
Message-ID: <CAAXf6LVVfX4KDPcT=jz-z1v2SF-9JO0zJsJiNgjWWpLjnXMFvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Dec 5, 2013 at 11:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 05 Dec 2013 23:08:11 +0100, Arnout Vandecappelle wrote:
>> On 05/12/13 11:54, Thomas De Schampheleire wrote:
>> > diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
>> > --- a/docs/manual/package-make-target.txt
>> > +++ b/docs/manual/package-make-target.txt
>> > @@ -63,9 +63,7 @@ Additionally, there are some other usefu
>> >   | +show-depends+    | Displays the dependencies required to build the
>> >   package
>> >
>> > -| +clean+           | Run the clean command of the package, also
>> > -uninstall the package from both the target and the staging directory; _note
>> > -that this is not implemented for all packages_
>> > +| +clean+           | Run the clean command of the package
>>
>>   The note should stay, I think. Clean is still not implemented for all
>> packages. By the way, weren't we going to remove clean as well?
>
> Yes, we should remove them as well. Can be done as part of a separate
> series, I believe. Removing the uninstall commands is already a good
> step forward.

Thanks for mentioning, I wasn't aware that -clean was also deprecated.
To be sure, foo-dirclean will still be supported, right?

I will create another patch series to remove -clean, but as ThomasP
said this should not block integration of this series already.

Best regards,
Thomas
