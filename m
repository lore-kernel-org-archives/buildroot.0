From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 11 May 2015 18:32:35 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
	3.10.17-1.0.1
In-Reply-To: <20150511132307.GA21085@kwain>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
 <20150504151227.GC11312@kwain>
 <20150504171543.68eb13fc@free-electrons.com>
 <CAAMH-ysBAw_r4XrTZBRvfMZnKd+py8KKZEWxmJm_-Tm9AcHmKQ@mail.gmail.com>
 <20150505101021.09a0a96e@free-electrons.com>
 <CAAMH-ysr3OCUScHsnTFzusXpNKRDVJsn+z7S0a3RN-JVskXhNg@mail.gmail.com>
 <20150511132307.GA21085@kwain>
Message-ID: <CAAMH-yvrDWD5Sgi1d=YTxqVMQfDNHHdoyx94izA8eX3mz4woeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On Mon, May 11, 2015 at 3:23 PM, Antoine T?nart
<antoine.tenart@free-electrons.com> wrote:
> On Tue, May 05, 2015 at 11:07:59AM +0200, Gary Bisson wrote:
>> On Tue, May 5, 2015 at 10:10 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > On Tue, 5 May 2015 10:06:11 +0200, Gary Bisson wrote:
>>
>> Antoine, do you have a patch ready for the GPU package? Because it
>> seems that it's not just a version bump:
>> https://github.com/Freescale/meta-fsl-arm/commit/74c86aa9639f6f20991ab64ea75177a017f8749a
>
> Please find the patch I used to bump the Vivante version to 5.0.11.p4.1
> attached.
>
> I'll be happy to have some feedbacks and to update the patch
> accordingly.

Thanks for the patch! Maybe we should start a new thread for this?

Here are my remarks with the current version:
- The package has been renamed from gpu-viv-bin-mx6q to imx-gpu-viv in
Yocto, I guess it'd be nice to follow their lead as I'm sure it
announces that this package will be used on other iMX platforms. Then
I don't know if it's better to have a commit just for renaming the
package and another one for the version bump.
- Also in Yocto they get rid of all the pkg-config files, do we still
need those in our case?
- Finally I'd copy/paste the commit log from Yocto as it explains
what's new in this version

Let me know if I can be of any help.

Thanks,
Gary
