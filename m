From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 23:38:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libqmi: add Libs.Private to
 qmi-glib.pc
In-Reply-To: <1b10c8a1-a19f-4446-0bb3-772e3b96e1e9@benettiengineering.com>
References: <20191030084048.11194-1-fontaine.fabrice@gmail.com>
 <ae52396b-25b3-f269-1108-1f6f83a2c45f@benettiengineering.com>
 <CAPi7W82LVWwt6AOByCsKtuu5CcY6dJJ2P3qayezbMwrX0qSKpA@mail.gmail.com>
 <1b10c8a1-a19f-4446-0bb3-772e3b96e1e9@benettiengineering.com>
Message-ID: <111ecca4-81a9-1c72-5f7d-620a7db9d84c@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/19 11:35 PM, Giulio Benetti wrote:
> Hi Fabrice,
> 
> On 12/20/19 11:34 PM, Fabrice Fontaine wrote:
>> Hi Giulio,
>>
>> Le ven. 20 d?c. 2019 ? 21:12, Giulio Benetti
>> <giulio.benetti@benettiengineering.com> a ?crit :
>>>
>>> Hi Fabrice,
>>>
>>> On 10/30/19 9:40 AM, Fabrice Fontaine wrote:
>>>> This will fix a static build failure with modem-manager and libmbim
>>>>
>>>> Fixes:
>>>>     - http://autobuild.buildroot.org/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c
>>>
>>> I can't reproduce this build failure and so can't test your patch to fix
>>> it. Basically it builds correctly.
>>> Can you double check?
>> As specified in https://patchwork.ozlabs.org/patch/1208297, this patch
>> is not needed anymore as it has been merged upstream and is already
>> included in 1.24.2 (see
>> https://gitlab.freedesktop.org/mobile-broadband/libqmi/blob/1.24.2/data/pkg-config/qmi-glib.pc.in)
> 
> I've missed that patch.
> 
>> so I set it to Not Applicable in patchwork.

Forgot to ask:
can you please give a check of all your patches(you submit a lot :-)) to 
see if they are correctly set in patchwork?

Thanks in advance
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
