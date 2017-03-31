From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 31 Mar 2017 22:58:42 +0530
Subject: [Buildroot] [PATCH 04/21] boot,
 package: use SPDX short identifier for GPLv3/GPLv3+
In-Reply-To: <9036f4ae-2d0a-4ea7-741d-7bfb32d41627@mind.be>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-5-git-send-email-rahulbedarkar89@gmail.com>
 <9036f4ae-2d0a-4ea7-741d-7bfb32d41627@mind.be>
Message-ID: <CA+NV+VneZXSraamjGHSoSOyjLg0f_nf7PaRQZXhShE05yGyDxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 31, 2017 at 3:26 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 30-03-17 15:43, Rahul Bedarkar wrote:
>> We want to use SPDX identifier for license string as much as possible.
>> SPDX short identifier for GPLv3/GPLv3+ is GPL-3.0/GPL-3.0+.
>>
>> This change is done using following command.
>> find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv3\>/GPL-3.0/g'
>>
>> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Fully reviewed manually again, as well as with the reverse sed.
> But now I have a headache :-)

Thanks for your review.

Regards,
Rahul
