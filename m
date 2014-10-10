From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 10 Oct 2014 09:41:57 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <20141008181319.17f49595@free-electrons.com>
References: <20141008105653.7252facd@free-electrons.com>
 <CAGm1_kvhqNy_3BKg2figgWw-FbCcBTAGxrXWJm3wUwv=e42sMQ@mail.gmail.com>
 <20141008181319.17f49595@free-electrons.com>
Message-ID: <CAGm1_ksryT=qOg3kJ5wnY31eioxZubQwgz_xOScgsqNDp_j7fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 8, 2014 at 6:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Wed, 8 Oct 2014 11:10:25 +0200, Yegor Yefremov wrote:
>
>> > Feel free to comment on these topics, or add new ones. For those who
>> > have an account, do not hesitate to update the Wiki accordingly.
>>
>> Could we add FIT topic? Basic creation and installation is already
>> implemented (http://patchwork.ozlabs.org/patch/396240/). The bigger
>> part is to control the priorities when and what step should be taken
>> first: at fist cpio and then fit, first fit and then ext2 etc.
>> I doubt, that ROOTFS_$(FSTYPE)_PRE_GEN_HOOKS and
>> ROOTFS_$(FSTYPE)_POST_TARGETS will help here.
>
> Sure. However, the two persons having expressed some knowledge about
> FIT are you and Thomas DS, and none of you will be at the meeting.
>
> Could you give some examples about the two cases you have (cpio and
> ext2) and how they cause issues with the current Buildroot? I
> understand it's a build ordering problem, but I'd like to understand
> better the use cases of FIT to see how we can solve this.

I've added FIT topic to the TODO list on elinux.org:
http://elinux.org/Buildroot#Core_Buildroot_infrastructure

Yegor
