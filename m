From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 3 Jun 2016 08:23:08 -0500
Subject: [Buildroot] [PATCH] make: Correct hash type
In-Reply-To: <20160603151922.3adb57af@free-electrons.com>
References: <1464959760-65290-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20160603151922.3adb57af@free-electrons.com>
Message-ID: <CANn-YGRw+NRk6G=y+D33v2TRrTawsUuHS_KfWsGvVzrAOaBK7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Jun 3, 2016 at 8:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  3 Jun 2016 08:16:00 -0500, Clayton Shotwell wrote:
>> The hash published in the make release emails is a md5sum, not a
>> sha1sum. Locally verified the downloaded file checks against the md5sum
>> after verifying the signature
>>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> ---
>>  package/make/make.hash | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks, but this issue has already been fixed in
> https://git.buildroot.net/buildroot/commit/?id=3aa3b892aba1169618075c9d55af3d57ad59092b.

My apologies. That's what I get for looking at my build results from
last night and not pulling down the latest first.

Thanks,
Clayton
