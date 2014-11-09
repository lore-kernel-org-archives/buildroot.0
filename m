From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 9 Nov 2014 13:33:04 +0100
Subject: [Buildroot] socat version
In-Reply-To: <54591B92.4030502@dest-unreach.org>
References: <CANxTyt5UVteo4xOJ85YfZP4J-3ZpVstGjnr8Yj4Sry93zfUqzg@mail.gmail.com>
 <CAGm1_ktAVRURcLbUaD=yqbE351gNXNLJshjVL-P1RVzWa4cSqg@mail.gmail.com>
 <54591B92.4030502@dest-unreach.org>
Message-ID: <CAGm1_ktZhn85FbtkwkegB5xGDqDYXgUvO=CCiY7SgFgoLOzWdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gerhard,

thanks for the info. What prevents you from releasing final socat 2?
Is it lacking feedback from other architectures, than Linux?

Yegor

On Tue, Nov 4, 2014 at 7:31 PM, Gerhard Rieger <gerhard@dest-unreach.org> wrote:
> Hello,
>
> the 3 tandem releases were all security fixes, this required parallel
> releases of version 1 and 2.
>
> I am planning a 2.0.0-b8 that includes all fixes up to version 1.7.2.4
> and some version 2 specific ones.
>
> Kind regards
> Gerhard
>
>
> On 11/04/2014 02:13 PM, Yegor Yefremov wrote:
>> On Tue, Nov 4, 2014 at 1:58 PM, Danomi Manchego
>> <danomimanchego123@gmail.com> wrote:
>>> All,
>>>
>>> Buildroot has been using the socat 2.0.0 series for a while.  We
>>> recently ran into a socat issue which was fixed upstream, but in a
>>> 1.7.2.4 release.  For rears, the socat people released a version 1
>>> release and a version 2 release in tandem, but for some reason, the
>>> latest release was only 1.7.2.4.  Reading about socat 2 at
>>> http://www.dest-unreach.org/socat/socat-version2.html I see it is
>>> (was?) described as "beta".
>>>
>>> So I was wondering: is buildroot on the 2.0.0 series under the
>>> normally sane presumption that 2.0 must be newer than 1.7, or is there
>>> an actual preference for the version 2 releases?
>> Adding Gerhard Rieger (socat maintainer) in CC
>>
>> Yegor
>
>
