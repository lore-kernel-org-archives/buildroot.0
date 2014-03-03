From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 3 Mar 2014 10:38:19 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303090219.65a08cc7@skate>
References: <20140303073010.B46B51015B7@stock.ovh.net>
 <20140303090219.65a08cc7@skate>
Message-ID: <CAHXCMMLUY6+eN6EzqVBk-=o0MO4QZktyRsmTHSFcRhX7B4Jk2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Mon, Mar 3, 2014 at 9:02 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  3 Mar 2014 08:30:10 +0100 (CET), Thomas Petazzoni wrote:
>
>>     mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a1e53d66d3962fd5431e7601937b071a0a3c2084/
>>     x86_64 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b363c63b5dda7d55c3bd4c6aedc10666471113ad/
>
> Problem of host python being Python 3 and not Python 2.
>
[...]
>>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/11e6c8c8d79d56ed43daf52e6d6dc80847709926/
>>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d75722fe096fc1ddbf62a51207b44b3cdbb6fed8/
>>    powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/09a7de5ef086005b2f003ccd58ee1dae268c26a1/
>
> Problem of host python being Python 3 and not Python 2.
[...]

I've started looking at this host-python2 thing.

So far, I have something working for host-scons, host-python-m2crypto and crda.
I still have to look at samba4, and cleanup the patches before
submitting them ;)


Regards,


Samuel
