From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 15 Feb 2018 17:15:05 -0800
Subject: [Buildroot] aarch64 + armhf multiarch support?
In-Reply-To: <CAGt4E5uPcFe=vwjnJU9XY_JeYawDQ0pEXt_3HGRSMXixkK=cAQ@mail.gmail.com>
References: <8EB2320D-F586-45FA-A9F4-F49D7FD5DD5D@jens-maus.de>
 <trinity-566065ed-72d1-4d19-9ae3-ab3368c01d3a-1518087937117@3c-app-mailcom-bs16>
 <E10BD61C-1C84-4039-A741-331FC3C8B961@jens-maus.de>
 <trinity-ad8db11c-f541-454e-8440-6c47520cc02f-1518089812434@3c-app-mailcom-bs15>
 <8A656331-7273-4C87-9E60-F62570C60828@jens-maus.de>
 <trinity-b580d83a-4026-4b4f-991c-2bd4db9d4f2f-1518091664400@3c-app-mailcom-bs13>
 <58733ED8-7525-4945-8665-6309CD838F3B@jens-maus.de>
 <trinity-508f433b-7a26-4c85-b97a-466528c8249f-1518179364228@3c-app-mailcom-bs05>
 <D8068D8E-77EA-42AA-A4FC-5A35BA5ABDBD@jens-maus.de>
 <CAGt4E5uxjDVhkxrneDbP4ip_fVT11DhduKsiiXLbENKnSB9huw@mail.gmail.com>
 <2FCF28DB-9039-45DD-9C48-A806BF0E63BE@jens-maus.de>
 <trinity-2838266b-ace7-400f-b269-42570dde54c2-1518262499968@3c-app-mailcom-bs15>
 <32D57CAA-56CA-4828-A157-67B03F040224@jens-maus.de>
 <5FDFFC51-FC11-461F-85F4-70E43911ED82@jens-maus.de>
 <CAGt4E5uPcFe=vwjnJU9XY_JeYawDQ0pEXt_3HGRSMXixkK=cAQ@mail.gmail.com>
Message-ID: <CAGt4E5t9MTxHaBjPne1ExOQJMrFSGn_Dn1-vrnRSeyXuOU2EVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 February 2018 at 17:37, Markus Mayer <mmayer@broadcom.com> wrote:
> On 12 February 2018 at 07:49, Jens Maus <mail@jens-maus.de> wrote:
>> Hi Markus,
>>
>>> Am 10.02.2018 um 12:56 schrieb Jens Maus <mail@jens-maus.de>:
>>>
>>> Hi Dagg,
>>>
>>>> Am 10.02.2018 um 12:35 schrieb daggs <daggs@gmx.com>:
>>>>
>>>> if you are not locked upon buildroot env, take a look at https://www.armbian.com/odroid-c2/
>>>> from what I can understand it will allow you to run 32bit applications on an 64 bit env.
>>>
>>> Thanks for the hint. But as I am happily maintaining a Smart Home platform (raspberrymatic.de) which is based on buildroot I really need to find a way in buildroot to support multiarch uses like I pointed out. And I really hope that Markus can point me in the rught direction how he actually implemented this himself. If possible, I could then potentially adapt his patch for Integration in mainline buildroot.
>>
>> Would you please be so kind and elaborating a bit more how you actually implemented 32bit armhf support in your aarch64 buildroot environment so that I can try to mimic this on my own buildroot environment.
>>
>> thanks in advance.
>
> Sorry, holiday today in British Columbia. I was out and about. I'll
> send the changes as RFC patches tomorrow.

I send the changes as patch series that can be found here:

http://lists.busybox.net/pipermail/buildroot/2018-February/213913.html

> Regards,
> -Markus
>
>> jens
>> --
>> Jens Maus, Dresden/Germany
>> http://jens-maus.de/
>>
>> *** Content is authentic only with digital signature  ***
>>
