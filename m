From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 08:36:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
	+ cleanups
In-Reply-To: <CADwac6BfHWKP_HWd_3g6t8MqtSW4zTcpYbChpbPh0O3q-N4=Jg@mail.gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
 <CADwac6BfHWKP_HWd_3g6t8MqtSW4zTcpYbChpbPh0O3q-N4=Jg@mail.gmail.com>
Message-ID: <CAAXf6LWkdfhGBsKvPpReEec2OXKdLgZbwSRwhCopqb06U6bKhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Assaf,

On Wed, Aug 28, 2013 at 6:41 AM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> Hey Thomas,
>
>> The text of the suboptions to the new getty top-level option are still
>> somewhat chaotic:
>> [*] Run a getty (login prompt) after boot
>> (ttyS0) Port to run a getty (login prompt) on
>> Baudrate to use (115200)  --->
>> (vt100) Value to assign the TERM environment variable
>> ()    other options to pass to getty
>>
>>
>> My proposal is to simplify the suboptions:
>> [*] Run a getty (login prompt) after boot
>> (ttyS0) tty port
>> baudrate (115200)  --->
>> (vt100) TERM environment variable
>> ()    other options to pass to getty
>
>
> Would you like to me submit another version of the patch with your wording,
> or will you do this yourself when applying the patch?

I'm just a 'regular' developer like you, I cannot apply the patch to
the buildroot repo. Only the maintainer Peter Korsgaard can do that
(or recently the maintainer-ad-interim Thomas Petazzoni)
I think it is best if you submit a new version, to minimize the work
he has to do.

Thanks again for your contributions.

Best regards,
Thomas
