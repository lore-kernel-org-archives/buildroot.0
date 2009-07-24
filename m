From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 24 Jul 2009 11:19:36 +0200
Subject: [Buildroot] Write Access to buildroot?
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
	<4A69741A.8010903@atmel.com>
	<20090724085603.GL13236@buzzloop.caiaq.de>
Message-ID: <9E543F22BF68405185D6B77291E4E5EF@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On Fri, Jul 24, 2009 at 10:43:06AM +0200, Ulf Samuelsson wrote:
>> > http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html
>> >
>> > and
>> >
>> > http://buildroot.net/git.html
>> >
>> >
>> OK,
>> Have not been active for a while and have about 3000 unread emails.
>> Seems to me that there a multiple people with write access
>> from the git commit mails, How come?
>
> That's just the git post-commit hook that takes the original author as
> sender address of the email. That always happens when Peter picks a
> patch and commits it to his tree.
>
>> Personally, I think it would make sense to have
>> a development git with personal branches with write access.
>>
>> This would complement any personal git's and would allow
>> easier testing with other people's patches.
>
> The thing about git and other distributed SCMs is: everbody has write
> access. To his local copy. You can than push your tree to an publically
> accesible external tree and share your personal patches with others.

That is the problem, buildroot does not provide a "publically accesible 
external tree"
for developers.
Why rely on github.com mentioned below which people won't find on their own?

If the development tree is within buildroot, then people are more likely to 
test it
or contribute.


> Or do the same thing by sending a thread of patches, if you don't want
> to share your patches among others before they're ready for the master
> branch.
>
>> The main tree, used for the release
>> could then pull changes from both the development tree
>> and the personal tree's.
>
> This is basicaly exactly the same thing than having your own repository,
> with the difference that the admins of ublibc.org won't have to fiddle
> with user permissions.

The difference is that the development tree is shared.

>
>> Is there a list of maintainers?
>> The target/device/Atmel tree will need to be updated due to the 
>> SAM9G10/G45/M10/M11.
>> The target/linux tree is also in need of maintenance.
>
> That's exactly why you want to have distributed repositories. You simply
> don't have to care about all that. Once you tested the patches in your
> tree for long enough, simply send in a pull request, and they will end
> up in the master branch.
>
> There a multiple free git hosting services out there, for example
> github.com.

Thanks for the link.


>
> Hope that helps :)
>
> Daniel
>


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
