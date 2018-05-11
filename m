From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 May 2018 10:30:16 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-10
In-Reply-To: <20180511144826.mtmjci4ppvacqorg@tarshish>
References: <20180511060052.6B11C208B6@mail.bootlin.com>
 <CANQCQpaXv50gaegjR954LMBd1FLj0U3jefnG_DSVAMujzv-qWQ@mail.gmail.com>
 <20180511144826.mtmjci4ppvacqorg@tarshish>
Message-ID: <CANQCQpaHtYa3DwxLu_337Zhocm1jdEfX5ZUuo_YSwp4r1Ti7UA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Fri, May 11, 2018 at 9:48 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Matt,
>
> On Fri, May 11, 2018 at 08:34:14AM -0500, Matthew Weber wrote:
>> On Fri, May 11, 2018 at 1:00 AM, Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>> > Hello,
>> >
>> > Build statistics for 2018-05-10
>> > ===============================
>> >
>> [snip]
>> >      aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/fca52a8ad6900650b2df8cbdb0c8868d2a5401ab | ORPH
>> >         i686 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/f5276b04b0aa2ab9e96f10c0032ff97d8b343d24 | ORPH
>> >          arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e2a1d5ff88f750bd60f41e36dc1c6fb41c66293b | ORPH
>> >      powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/db7dd6c07a77be4792680ba6f8b116090b470259 | ORPH
>>
>> Fixed by: http://patchwork.ozlabs.org/patch/911114/
>
> traceroute fails[1] for a similar reason on your autobuilder, this time
> because of -lm. I wonder what makes your machine special?
>
> [1] http://autobuild.buildroot.net/?reason=traceroute-2.1.0


I'll take a look.  Nothing to special about it.  I know the version of
make is 3.8.1 so that we can build older kernels.....

I'll take it offline for now while checking things out.

Matt
