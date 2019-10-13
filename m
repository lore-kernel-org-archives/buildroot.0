From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 13 Oct 2019 11:57:40 -0300
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <406efb70-4eba-09f6-9c09-939f8f768c02@gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
 <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
 <20191013154223.60ede697@windsurf>
 <406efb70-4eba-09f6-9c09-939f8f768c02@gmail.com>
Message-ID: <740C8925-BCBC-4A77-AF69-68E7AE607B92@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a beaglebone black and can make some experiments this week.

Carlos Santos <unixmania@gmail.com>

Em 13 de out de 2019, ?(s) 10:57, Romain Naour <romain.naour@gmail.com> escreveu:

> Hello Thomas,
> 
>> Le 13/10/2019 ? 15:42, Thomas Petazzoni a ?crit :
>> On Sun, 13 Oct 2019 11:29:14 +0200
>> Romain Naour <romain.naour@gmail.com> wrote:
>> 
>>> There is an old patch [2] [3] in patchwork bumping the kernel (to 4.9) used in
>>> this defconfig but it's marked "Changes Requested" due to issues.
>>> 
>>> If we really want to keep this defconfig (as is), we have to use an external
>>> toolchain old enough to build the kernel and TI's modules.
>> 
>> The right way to fix this defconfig is certainly not to use an older
>> toolchain, but rather to use a more modern kernel. It's BeagleBone,
>> definitely not a legacy/ancient platform, it's still in widespread use,
>> there is quite certainly a kernel + SGX OpenGL stuff that is reasonably
>> recent ?
> 
> I'm agree with you, but we need someone brave enough to work on this :)
> I don't have a Beaglebone to do a runtime test.
> 
> Best regards,
> Romain
> 
>> 
>> Best regards,
>> 
>> Thomas
>> 
> 
