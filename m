From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 14 May 2017 21:27:46 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-10
In-Reply-To: <CANQCQpaDCSqu9iKLeuTyB4+py5L2JDjPSYDWgxoFUuS2vF1mCg@mail.gmail.com>
References: <20170511062842.8AC6121D45@mail.free-electrons.com>
 <CAGm1_kuce8He8uG1CH4a0XyuFaO6C5zBVVzYQkz7qGmz+r36ug@mail.gmail.com>
 <CANQCQpaDCSqu9iKLeuTyB4+py5L2JDjPSYDWgxoFUuS2vF1mCg@mail.gmail.com>
Message-ID: <CANQCQpbggiAip7PTT=Tm2ewwhyEfK_bqBP7nCG9fOYBB7oiH8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor.

On Thu, May 11, 2017 at 7:22 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Yegor,
>
>
> On Thursday, May 11, 2017, Yegor Yefremov <yegorslists@googlemail.com>
> wrote:
>>
>> On Thu, May 11, 2017 at 8:28 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Hello,
>> >
>> > Build statistics for 2017-05-10
>> > ================================
>> >
>> >       successes : 253
>> >        failures : 24
>> >        timeouts : 0
>> >           TOTAL : 277
>> >
>> > Classification of failures by reason
>> > ====================================
>> >
>> >                     radvd-2.12 | 4
>> >            modem-manager-1.6.4 | 3
>> >                  efibootmgr-14 | 2
>> >                   libcdio-0.94 | 2
>> >         ltp-testsuite-20170116 | 2
>> > openblas-f04af36ad0e85b64f1... | 2
>> >                pulseview-0.3.0 | 2
>> >              rabbitmq-c-v0.8.0 | 2
>> >           mediastreamer-2.14.0 | 1
>> >                 protobuf-3.2.0 | 1
>> >           qt5declarative-5.8.0 | 1
>> >                      qwt-6.1.3 | 1
>> >               strongswan-5.4.0 | 1
>> >
>> >
>> > Detail of failures
>> > ===================
>> >
>> >          arm |                  efibootmgr-14 | NOK |
>> > http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe80954a0a98f
>> > |
>> >          arm |                  efibootmgr-14 | NOK |
>> > http://autobuild.buildroot.net/results/368656c338f6ea732f564291d660bc1721b34af7
>> > |
>> >          arc |                   libcdio-0.94 | NOK |
>> > http://autobuild.buildroot.net/results/c909e8c397ab972b6aa4d370572cad4fae284d00
>> > |
>> >          arc |                   libcdio-0.94 | NOK |
>> > http://autobuild.buildroot.net/results/d681917034730d374092881e90875d3149e31774
>> > |
>> >          arm |         ltp-testsuite-20170116 | NOK |
>> > http://autobuild.buildroot.net/results/cb94f4859c7cf60c76dd978ed941883ff732ba11
>> > |
>> >        sparc |         ltp-testsuite-20170116 | NOK |
>> > http://autobuild.buildroot.net/results/e68191d1ae42100119ab2f872eeff8ba4b1b7c8d
>> > |
>> >         m68k |           mediastreamer-2.14.0 | NOK |
>> > http://autobuild.buildroot.net/results/775c81b5d0064cb196bbb367368dd76eb46ecf93
>> > | ORPH
>> >          arm |            modem-manager-1.6.4 | NOK |
>> > http://autobuild.buildroot.net/results/fe9b6b1b1399a4e8aafc6a326c81ec97c2480025
>> > |
>> >         i686 |            modem-manager-1.6.4 | NOK |
>> > http://autobuild.buildroot.net/results/40eef797b4d8d53fc6e10f2048316d63549caf6d
>> > |
>> >          arm |            modem-manager-1.6.4 | NOK |
>> > http://autobuild.buildroot.net/results/e3e3b61fb1162648f45c73b2a07509e0ab95b3d4
>> > |
>>
>> Hi Matthew,
>>
>> this issues looks like the one you've fixed for libqmi. Could you take a
>> look?
>>
>>

The following patch resolves this build issue.
https://patchwork.ozlabs.org/patch/762195/
