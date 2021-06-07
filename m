From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Jun 2021 21:21:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/libcamera: fix atomic linking
 with qcam
In-Reply-To: <57131d90-7811-7cee-e986-f5711e40abfa@ideasonboard.com>
References: <20210603053644.3432-1-fontaine.fabrice@gmail.com>
 <20210603053644.3432-2-fontaine.fabrice@gmail.com>
 <ce1a528d-23f3-e2f6-081d-7e2962d2cc9a@ideasonboard.com>
 <CAPi7W80C77dVVQt+gf=OaMziffLjhz0t81y8Y=zKhRe2CH_GEQ@mail.gmail.com>
 <57131d90-7811-7cee-e986-f5711e40abfa@ideasonboard.com>
Message-ID: <c77f8981-f202-4923-59f3-62ac67ef1958@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2021 15:07, Kieran Bingham wrote:
> Hi Fabrice,
> 
> On 03/06/2021 13:17, Fabrice Fontaine wrote:
>> Hi Kieran,
>>
>> Le jeu. 3 juin 2021 ? 13:06, Kieran Bingham
>> <kieran.bingham@ideasonboard.com> a ?crit :
>>>
>>> Hi Fabrice,
>>>
>>> On 03/06/2021 06:36, Fabrice Fontaine wrote:
[snip]
>>>> +[Retrieved from:
>>>> +https://git.linuxtv.org/libcamera.git/commit/?id=59de56f42a0fda1b8e778fb237b7bce494dc0584]

 Although we generally prefer upstream patches, in this case I don't think it's
worth replacing the patch that is already committed with the upstream one, since
it's anyway just a build-time change. Therefore, I've marked the series as Rejected.

>>>
>>> Given that this is now an upstream commit - wouldn't it make more sense
>>> to bump the libcamera version to here, rather than carry the patch back?
>>>
>>> Or is there some reason you don't want to update yet?
>> Yes, there is a very good reason: buildroot 2021.05 will be released
>> in the next few hours/days.
> 
> That's understandable, no problem here!

 Now that 2021.05 has been released, it would be a good time to bump libcamera
and remove the patch!

 Regards,
 Arnout
