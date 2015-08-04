From: DATACOM - Farina <farina@datacom.ind.br>
Date: Tue, 04 Aug 2015 10:31:50 -0300
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
In-Reply-To: <20150804105537.3a5e47f6@free-electrons.com>
References: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>
 <20150804105537.3a5e47f6@free-electrons.com>
Message-ID: <55C0BEC6.8040207@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04-08-2015 05:55, Thomas Petazzoni wrote:
> Augusto,
>
> On Mon,  3 Aug 2015 17:36:59 -0300, Augusto Farina wrote:
>> Colorama is a simple cross-platform colored terminal text in Python.
>>
>> Tested on a PowerPC e500v2 board. Host build support is also added in
>> the package makefile, as python-jinja2, because we have third-party
>> software that requires it (e.g. ARM mbed build-system).
>
> As usual, I'm a little bit reluctant to add host packages that are not
> used by any other package in Buildroot, because it means they are never
> tested.
>

I've heard this :)


> Do you intend to submit some packages that will use
> host-python-colorama?
>

At this specific moment, no. But we are analyzing the ARM mbed package, 
which are widely used libraries and tools for ARM microcontrollers, and 
makes use of host-python-colorama on its build-system.


> Also, not your fault, but I must say it's a bit odd for a build-system
> to have a mandatory dependency on something that allows to colorize the
> terminal output :)
>

I agree with you. But we are trying not to keep recipes of open-source 
packages in our repository, and I just thought this might be useful to 
someone else.


Cheers,

-- 
Augusto Farina
DATACOM / R&D - Access
www.datacom.ind.br
