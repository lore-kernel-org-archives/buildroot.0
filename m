From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 29 Nov 2012 07:09:18 +1300
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <20121128143100.152d26d6@skate>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <20121128143100.152d26d6@skate>
Message-ID: <CAE21AQqs92x6=x_ELTWz7MqMLNDrq9VDXK17+P_2sB-7wc=JXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 29, 2012 at 2:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Charles Manning,
>
> On Wed, 28 Nov 2012 14:37:46 +1300, Charles Manning wrote:
>
>> I'm a buildroot newbie and am trying to figure out what went wrong
>> here.
>
> This looks odd. Could you give us your Buildroot .config and tell us
> the Buildroot version you're using?

Hello Thomas

I have been working up from beaglebone defconfig towards a rootfs that
I want for a project.

The confg-201211281330 worked fine. I then added the bluez package and
things fell over.

I am using HEAD as of some time yesterday: commit
3bdbe9abb90de0262832d5d545f239fa41fb0e91

btw: Thank you very much for all you do for the community.

Regards

Charles
-------------- next part --------------
A non-text attachment was scrubbed...
Name: failing-config
Type: application/octet-stream
Size: 25149 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121129/37202728/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config-201211281330
Type: application/octet-stream
Size: 25038 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121129/37202728/attachment-0003.obj>
