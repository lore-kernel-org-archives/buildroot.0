From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 5 Jan 2018 11:56:40 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-03
In-Reply-To: <CANQCQpahMS8fVOAS1-1R9veM_4LoO8xdnRosEs9yKNC4EtTERg@mail.gmail.com>
References: <20180104070035.EEAA2207B1@mail.free-electrons.com>
 <12466b9b-4377-b65c-bdb7-c76b136fc3ef@gmail.com>
 <CANQCQpahMS8fVOAS1-1R9veM_4LoO8xdnRosEs9yKNC4EtTERg@mail.gmail.com>
Message-ID: <CANQCQpaphdhYG8Z23vnxEvUN=fG+UVra2gzc-QApLjbmCeGdpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain / Thomas,

On Fri, Jan 5, 2018 at 11:53 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Romain,
>
> On Thu, Jan 4, 2018 at 8:42 AM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Matt,
>>
>> Le 04/01/2018 ? 08:00, Thomas Petazzoni a ?crit :
>>> Hello,
>>>
>
>
> Looks like a new failure, would you mind sending the instance logs?
>
> http://autobuild.buildroot.net/results/711/71197db2d13428d2d32d02efe528a3e9d75e498a//
>
> http://autobuild.buildroot.net/results/40f/40f1882b9958de1f962358d7b981cb775d95d426//
>
>
> I've also got one I'm looking into too
> http://autobuild.buildroot.net/results/4a7/4a7f7c07fd68c96e26880f8f08beff73ae2aa1ad//


For this one it looks like our timeout needs to be longer.  Maybe we
could set it to 2hrs and see if we hit.

Matt
