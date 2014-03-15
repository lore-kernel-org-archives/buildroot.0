From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Sat, 15 Mar 2014 16:59:30 -0500
Subject: [Buildroot] [PATCH v2] pyrex: new host package
In-Reply-To: <20140314232045.GE16649@free.fr>
References: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
 <1394837899-14937-2-git-send-email-rc.lsw.collaborate@gmail.com>
 <20140314232045.GE16649@free.fr>
Message-ID: <CAC2S8kgN+hnnagtQ=Ns4iuTU=1Eq195nWooesd_iAh7uC=qSfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Fri, Mar 14, 2014 at 6:20 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Matt, All,
>
> On 2014-03-14 17:58 -0500, rc.lsw.collaborate at gmail.com spake thusly:
>> From: Matt Weber <mlweber1@rockwellcollins.com>
>
> Could you add in the commit log what Pyrex is and why it would be needed
> as a host-only package?
Sure, I'll submit v3 and include a good description.

> I can read the description in the help text, but that does not say why
> it is interesting to have Pyrex as a host-tool in Buildroot.
>
> Also, you're not adding any in-tree user of host-pyrex (maybe you have
> one or two such packages ready to be submitted? ;-) ), which does not
> help to understand why it is needed.
I've got a pkg almost ready to submit that wrappers the libpcap
library with this
framework.  I should be able to test it on target in a couple days and then
submit that new pkg patch.

Thanks for the review!
Matt
