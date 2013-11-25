From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Nov 2013 16:55:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-24
In-Reply-To: <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
References: <20131125073002.2FB821014B4@stock.ovh.net>
 <OF0E9DA113.910F94AB-ON86257C2E.00328BF4-86257C2E.003369F4@rockwellcollins.com>
Message-ID: <CAAXf6LVEDgF+s-e90py61mucPmm96HNCShGpu12QdfYxumW80w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Mon, Nov 25, 2013 at 10:21 AM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Thomas P, All,
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/25/2013
> 01:30:02 AM:
>
>>    powerpc |           host-protobuf-c-0.15 | NOK |
>> http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/
>
> I looked into this last night and I was unable to reproduce the issue (from
> pulling the defconfig). From looking at the logs, it appears that the issue
> is that a file wasn't generated before trying to compile the code. In my
> experience, errors like below are due to the makefile not having their
> dependencies correct. I tired rebuilding this package around 5-7 times and I
> never ran into this error with the defconfig provided.

How exactly did you start the build?
Did you do something like 'make toolchain host-protobuf-c' or simply 'make' ?
While the former is a shortcut that can sometimes also show the
problem, the latter has a higher chance of doing so. So when the first
method doesn't work, you should try the second.

Best regards,
Thomas
