From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Dec 2013 21:27:43 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
Message-ID: <CAAXf6LV24Qt3YS7Hz6Fx=jX6JiZ3nEPBJ9oeuQG=oSnqicTpSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Final overview of this cleanup session:

On Sat, Dec 14, 2013 at 12:52 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
[..]
>>
>> iucode-tool: new package
>> Richard Braun <rbraun@sceen.net>
>> http://patchwork.ozlabs.org/patch/185420
>
> No feedback yet.

No feedback, marking as Rejected.

>
>>
>> [3/3] mplayer: Fix DVD support
>> Valentine Barshak <gvaxon@gmail.com>
>> http://patchwork.ozlabs.org/patch/187437
>>
>
> No feedback yet.

It seems a variant of this patch is already in buildroot:
http://git.buildroot.org/buildroot/commit/?id=63fbc1834f98f37cc43514f13cb75c1034dcf454
so I'm marking this one as Superseded.

>
>> pkg-infra: produce legal info for proprietary packages
>> Richard Braun <rbraun@sceen.net>
>> http://patchwork.ozlabs.org/patch/187775
>
> I will try to look into this. I brought up this issue before, too.
>
>>
>> intel-microcode: new package
>> Richard Braun <rbraun@sceen.net>
>> http://patchwork.ozlabs.org/patch/187776
>
> No feedback yet.

These two patches are now Delegated to me, I will try to look into
them (but of course others are welcome to help)
At first sight, I think that intel-microcode could be applied almost
as-is, because in the current legal info there is support for
proprietary packages. Probably the exact license definition should be
reviewed. The first patch could be rejected for the same reason (but I
need to double-check).

>
>>
>> [1/2] Makefile: Fix target-purgelocales
>> Valentine Barshak <gvaxon@gmail.com>
>> http://patchwork.ozlabs.org/patch/188623
>>
>> [2/2] Makefile: Add /usr/lib/locale to target-purgelocales
>> Valentine Barshak <gvaxon@gmail.com>
>> http://patchwork.ozlabs.org/patch/188624
>
> I tested these patches and provided some comments to Valentine. It
> seems there is already something broken in buildroot locale support,
> partially fixed by these patches, but not entirely.

I think the second patch can be applied as-is. The first one seems
correct to, but I will double-check.
There is still a problem with aliases in buildroot locale handling,
but this may be a separate issue.
I marked these two patches as Delegated to me, I hope to find some
time to looking into them (help is welcome).

>
>>
>> rpm5
>> Alexander Khryukin <alexander@mezon.ru>
>> http://patchwork.ozlabs.org/patch/190962
>
> No feedback yet.
>
>>
>> putty: UNIX port of the famous Telnet and SSH GUI client
>> Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> http://patchwork.ozlabs.org/patch/191204
>
> No feedback yet.

Both marked as rejected.

>
>>
>> new pkg tor
>> dev0 <matzeton@googlemail.com>
>> http://patchwork.ozlabs.org/patch/193560
>
> I received private feedback from 'dev0' saying that he is no longer
> interested in this patch, so I will mark this as Rejected. However,
> don't hesitate to adopt this patch if it is useful to you...

As said: Rejected.

>
>>
>> [PATCHv3] QtSerialPort: new package
>> Thiago Correa <thiago.correa@gmail.com>
>> http://patchwork.ozlabs.org/patch/195057
>
> No feedback yet.

Feedback from Thiago is that there is already support for this package
in qt5, but not for qt4.
The proposal was to Reject the patch (and thus ignore missing qt4
support). I'm following this proposal.

Thanks to all who provided feedback!

Best regards,
Thomas
