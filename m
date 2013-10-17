From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Oct 2013 10:18:30 +0200
Subject: [Buildroot] [PATCH 9/9] manual: rework Deploying images chapter
In-Reply-To: <CAAXf6LU6zfWqz2Jo1WpD-yUyv7b5BKqa23Mn7bovELkZtVeNjg@mail.gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <a2cb1b7caaa580f341abbb3788d18323c3e2e7c3.1381002281.git.s.martin49@gmail.com>
 <52546B18.7010207@mind.be>
 <CAAXf6LUspWfQkggfq2_+vmuDHUcPQUUAa6D3_-J7jxG8-0svBg@mail.gmail.com>
 <525F051C.90200@mind.be>
 <CAAXf6LU6zfWqz2Jo1WpD-yUyv7b5BKqa23Mn7bovELkZtVeNjg@mail.gmail.com>
Message-ID: <525F9D56.3010808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/13 10:12, Thomas De Schampheleire wrote:
> On Wed, Oct 16, 2013 at 11:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 15/10/13 22:27, Thomas De Schampheleire wrote:
> [..]
>>>
>>>
>>> Regarding the section names, currently you have:
>>> 4. Deploying target images built with Buildroot
>>> 4.1. Deploying images on the target hardware
>>> 4.2. Booting images in emulators
>>> 4.3. Preparing a raw disk image for customized target layout
>>> 4.4. Preparing a bootable raw disk file for virtualization
>>> 4.5. Booting the generated image over the network
>>> 4.6. Chroot into generated image
>>>
>>> While 4 and 4.1 talk about 'deploying' the other sections start using
>>> other terminology. Here is a suggestion:
>>> 4. Deploying target images built with Buildroot
>>> 4.1. Deploying images on the target hardware
>>> 4.2. Deploying images in emulators
>>> 4.3. Preparing a raw disk image for customized target layout
>>> 4.4. Preparing a bootable raw disk file for virtualization
>>> 4.5. Deploying images over the network
>>> 4.6. Chroot into generated image
>>>
>>> In fact, 4.5 also talks about target hardware, so should probably be
>>> moved above, or even a subsection of 4.1.
>>> I'm not yet a big fan of the names of 4.3, 4.4 and 4.6 (it's unclear
>>> to me what they really do based on the title) but I don't have good
>>> suggestions.
>>
>>
>>   Right, my attempt: a bit of reordering and more "deploying":
>>
>>
>> 4. Deploying target images built with Buildroot
>> 4.1. Deploying images on the target hardware
>>       (includes the network deployment)
>> 4.2. Deploying images on removable media
>> 4.3. Preparing a bootable raw disk file for virtualization
>> 4.4. Deploying images in emulators
>> 4.5. Chroot into generated image
>
> I like it, except still the 4.5. What is the use case for chroot'ing
> into such an image? To manipulate the image? Or in the case of the
> same target/native architecture to actually run stuff? Can we change
> the section name to reflect the purpose rather than the solution?
> If 'chroot' is the most clear way to put it in the section name, then
> I'd change to:
> "chroot'ing into a target image"
> ('ing' to match the other sections, 'a' article to make it read
> better, and lowercase chroot because it's a special name and
> capitalizing that reads odd IMO)

  Ack that.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
