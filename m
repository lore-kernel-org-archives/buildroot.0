From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 2 May 2014 07:35:31 +0200
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <1398975999806-68677.post@n4.nabble.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
 <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
 <1398968712814-68658.post@n4.nabble.com>
 <3e06667e-ebb4-4571-9f34-dd559a37fb0e@email.android.com>
 <1398975999806-68677.post@n4.nabble.com>
Message-ID: <CAAXf6LWEukHG4+BX7WzsxbXYjUahxNW8A2rNk37agJBgyNS0MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brian,

On Thu, May 1, 2014 at 10:26 PM, brianclements <brian@brianclements.net> wrote:
[..]
>
>>In the menuconfig, in the toolchain menu, you can specify the toolchain
> type. It is set to 'Buildroot' by >default, but you can specify 'external'
> here. I then used the default proposed toolchain (Sourcery)
>
> So I've found the fix. Selecting the external toolchain "Sourcery" (and WOW
> is it much faster) with my other selections same as before of x86_64 and
> git, was all I needed to get git to work. So I know what I need to do now to
> get it to work for my uses. But I'm sure that still means there is a bug
> somewhere in the buildroot toolchain. I'm not sure how to go about finding
> it for you, but I'd be more then happy to test and reproduce things along
> the way for you if you desire. Let me know,

Could you send me the buildroot config you were using before?
I will build the exact same config this time and see if I can reproduce on qemu.

Best regards,
Thomas
