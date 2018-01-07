From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Jan 2018 23:16:08 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-03
In-Reply-To: <CANQCQpaqZdMqsoXcODeTjM_hLdH5mX4p3Mmmj4zO6Ab258L1DQ@mail.gmail.com>
References: <20180104070035.EEAA2207B1@mail.free-electrons.com>
 <12466b9b-4377-b65c-bdb7-c76b136fc3ef@gmail.com>
 <CANQCQpahMS8fVOAS1-1R9veM_4LoO8xdnRosEs9yKNC4EtTERg@mail.gmail.com>
 <CANQCQpaphdhYG8Z23vnxEvUN=fG+UVra2gzc-QApLjbmCeGdpQ@mail.gmail.com>
 <CANQCQpaqZdMqsoXcODeTjM_hLdH5mX4p3Mmmj4zO6Ab258L1DQ@mail.gmail.com>
Message-ID: <cbf92a23-f475-b9e4-a71c-d3edf95e46da@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 05/01/2018 ? 21:57, Matthew Weber a ?crit?:
> Romain,
> 
> On Fri, Jan 5, 2018 at 11:56 AM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Romain / Thomas,
>>
>> On Fri, Jan 5, 2018 at 11:53 AM, Matthew Weber
>> <matthew.weber@rockwellcollins.com> wrote:
>>> Romain,
>>>
>>> On Thu, Jan 4, 2018 at 8:42 AM, Romain Naour <romain.naour@gmail.com> wrote:
>>>> Hi Matt,
>>>>
>>>> Le 04/01/2018 ? 08:00, Thomas Petazzoni a ?crit :
>>>>> Hello,
>>>>>
>>>
>>>
>>> Looks like a new failure, would you mind sending the instance logs?
>>>
>>> http://autobuild.buildroot.net/results/711/71197db2d13428d2d32d02efe528a3e9d75e498a//
>>>
>>> http://autobuild.buildroot.net/results/40f/40f1882b9958de1f962358d7b981cb775d95d426//
> 
> I've brought a 17.10 machine online (4.13 kernel and 2.26 glibc).
> We'll see what it finds.
> http://autobuild.buildroot.net/?submitter=Matt+Weber+%28U17.10%29
> 

The issue has been reproduced on U17.10

http://autobuild.buildroot.net/results/3f8/3f8275ca37bb5c1eabefff19ed28781f9f5c1164/build-end.log


Here is the instance log for the following build:

[Fri, 05 Jan 2018 11:35:51] INFO: build started
[Sat, 06 Jan 2018 03:19:51] INFO: build hung
[Sat, 06 Jan 2018 03:19:51] INFO: file mtime:[02:19:47]
[Sat, 06 Jan 2018 03:19:51] INFO: timeNow:[03:19:51]
[Sat, 06 Jan 2018 03:19:51] INFO: file mtime(second read):[02:19:47]
[Sat, 06 Jan 2018 03:19:51] INFO: build timed out [-9]

http://autobuild.buildroot.net/results/ca7/ca70ce7cdbdb834bf448bcb168de9d5bba9f9178/build-end.log

Hope this can help...

Best regards,
Romain
