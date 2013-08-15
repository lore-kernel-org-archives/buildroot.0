From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 15 Aug 2013 21:01:45 +0200
Subject: [Buildroot] [PATCH 3/5] manual: update beyond Buildroot section
In-Reply-To: <5209CB2C.4030408@mind.be>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
 <1375824984-8226-4-git-send-email-s.martin49@gmail.com>
 <20130807113910.2358816a@skate>
 <CAKvQZ_3UxzreEtWQ3E++3xZ1o4W_Rn1gzKrYQo2CNOnQ_hZpfg@mail.gmail.com>
 <CAHXCMMJ2iXQQyju9jdx_4sXCvpUa25O3fSWA9p8_yRPv92C7NQ@mail.gmail.com>
 <20130808200100.6f677bf5@skate> <5209CB2C.4030408@mind.be>
Message-ID: <CAHXCMMLz6y46OSor3NPthHqpBwbuGJ1asGd3aVw1StEXYiN1Fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

2013/8/13 Arnout Vandecappelle <arnout@mind.be>
>
> On 08/08/13 20:01, Thomas Petazzoni wrote:
>>
>> Dear Samuel Martin,
>>
>> On Thu, 8 Aug 2013 14:36:39 +0200, Samuel Martin wrote:
>>>
>>> So, its right place may not be the manual, but some extended readme
>>> and/or sample
>>> post-image scripts.
>>> What about this?
>>
>>
>> I do believe it has its place into the manual, but it needs to be
>> written up properly, taking into account the other use cases (booting
>> on ARM/PowerPC platforms), and find a better place for this.
>
>
>  However, I think the "needs to be written up properly" aspect should not
stop a piece of documentation to be added to the manual. Even if it is not
written up properly, it will be useful for some people.

Right.

To move forward on this, I'd like to have people's opinion about a couple
of questions:
1- what is the best place in the manual for such a section?
  - between the current chapters 3 - "Working with Buildroot" - and 4 - the
FAQ/troubleshooting;
  - or in the "Beyond Buildroot" chapter
  - or in appendices
  - somewhere else
2- should we put the "network boot" in another section, rather than just
aside the disk image creation? (so, split the main addition of the patch in
2 clearly distinguished section/chapter?)
3- should we add a chapter focus on booting the image?
4- where should the VM disk image creation section belong to?
5- how do you think the manual should be organized about these topics
(which are: "booting images", "generating disk image for device or vm")?
what should be the perimeter these sections?



Eventually, I think the manual needs something right after the chapters 3 -
"Working with Buildroot" - dealing with booting the image (title suggestion
is more than welcome).
This chapter could include:
- generic things about deployment on the actual hardware (rougthly: "refer
to the readme in the board directory of the vendor instructions");
- booting the qemu images;
- boot over nfs (as a way to speed up the development process);
- and redirect to the "Beyond Buildroot" chapter for less common ways
(chroot, etc).

The "Beyond Buildroot" chapter could talk about:
- chroot/binfmt/etc;
- generating disk image for specific device (e.g. a disk image for a RPi,
containing several partitions, and so on. IIRC, Yann quickly talked about
it months ago, maybe he could fill some gaps in the doc or provide sample
scripts...);
- generating disk image for a VM (like Willy already wrote it down).

In this view, I don't know yet to what section/chapter PXE boot belongs to
because it's something rather x86-oriented to me...



Opinions, comments, suggestions, critics?
TIA for your inputs.


Regards,

--
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130815/46802682/attachment.html>
