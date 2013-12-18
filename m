From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Dec 2013 21:52:57 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline
	December 20)
In-Reply-To: <20131215130822.GA27101@dalaran.sceen.net>
References: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
 <CAAXf6LXDALKC9CKcOSqS3BkPaDeK34ao1D+u8NkJKLgTKe5Npg@mail.gmail.com>
 <20131215130822.GA27101@dalaran.sceen.net>
Message-ID: <CAAXf6LW0vSxTCGsgmhToHd9Q36NpuG6NMPL6XqDMAGOT8nObfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard, all,

On Sun, Dec 15, 2013 at 2:08 PM, Richard Braun <rbraun@sceen.net> wrote:
> On Sat, Dec 14, 2013 at 12:52:22PM +0100, Thomas De Schampheleire wrote:
>> > iucode-tool: new package
>> > Richard Braun <rbraun@sceen.net>
>> > http://patchwork.ozlabs.org/patch/185420
>>
>> No feedback yet.
>
>> > pkg-infra: produce legal info for proprietary packages
>> > Richard Braun <rbraun@sceen.net>
>> > http://patchwork.ozlabs.org/patch/187775
>>
>> I will try to look into this. I brought up this issue before, too.
>>
>> >
>> > intel-microcode: new package
>> > Richard Braun <rbraun@sceen.net>
>> > http://patchwork.ozlabs.org/patch/187776
>>
>> No feedback yet.
>
> I've not been working on any buildroot related project for some time
> now and it doesn't look like i'll be any time soon. And it turned out
> the microcode packages didn't get used at work (for completely external
> reasons), so noone back there is going to take over. Please do what you
> think is most appropriate. IIRC, the packages were in good shape and
> license management was the only real issue.

Thanks for the feedback.
I marked the intel-microcode and the legal-info-proprietary patch as
'delegated to' me.
The legal info discussion has been continued in this thread:
http://lists.busybox.net/pipermail/buildroot/2013-October/079358.html
in which a conclusion was made (among others FOO_SAVE_LEGAL_INFO =
YES/NO), but it has not yet been implemented.
I added this to my todo list, but obviously others are free to look into it too.

Best regards,
Thomas
