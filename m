From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 28 Oct 2014 15:15:59 +0100
Subject: [Buildroot] [RFC] Responsive Design Website
In-Reply-To: <CA+TH9V=a2bt7_X=7FGrgkAD5MivuSG5fUFzXSBO7=3DjoWKNGA@mail.gmail.com>
References: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
 <CAAXf6LXnt=MEKpTLVUx4SmuJOHStdMQ-gsKQHax0me=x8obwxA@mail.gmail.com>
 <CA+TH9V=a2bt7_X=7FGrgkAD5MivuSG5fUFzXSBO7=3DjoWKNGA@mail.gmail.com>
Message-ID: <CAAXf6LVmeih7Xj14OX_bG2OJNLHqod4k0eaUGjaP03MxztCAKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Tue, Oct 28, 2014 at 2:31 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Hi Thomas!
>
>> Some comments:
>>
>> - the 'Buildroot' button top-left should link to the home page,
>> currently it links to #.
>> - for some reason, the website does not support zooming on Android
>> with Dolphin Browser. I haven't checked other browsers. Is this
>> expected?
>
> Yes, it's expected, I disabled zooming due to the responsive layout.
> If you want, I can re-enable it, but it's a little bit in contrast
> with RD principles.

This is arguable. Here is an interesting link on this topic:
http://ux.stackexchange.com/questions/37511/should-users-be-able-to-zoom-in-a-responsive-webdesign

From the top answers it seems the consensus is that zooming should be possible.


>
>> - on a desktop, the Sponsors page does not look the same way as the
>> original. (Firefox 29 on Linux)
>
> As stated in the original email, the work is not complete, I started
> with the homepage and included header and footer just to show
> something. Obviously, if you love the result, I can commit a full set
> of patches.
> In the next few days, I'll update my copy of the website, when it
> looks as expected, I'll send a PR.

I definitely like these changes. Of course I cannot speak for the
entire community, but I do not expect anyone to object against a
better mobile experience of the website, provided that the desktop
experience remains good.

Looking forward to the result!

Best regards,
Thomas
