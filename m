From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2014 19:56:32 +0100
Subject: [Buildroot] [pkg-perl infra V5 8/8] cpanminus: remove it
In-Reply-To: <20140210192916.669fb580@skate>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
 <1391763337-30660-9-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LXwZXeYiHrUyoG6Nuga2fi4P-Rsy+0mph-PtKbcB=v_fA@mail.gmail.com>
 <CAB0FRsvVCz71SAY=_5jev+eDjChszCVX00eQ4oa_DEYH2YcbCA@mail.gmail.com>
 <20140210192916.669fb580@skate>
Message-ID: <cc01dbe9-70c2-4a35-90df-1722f8341af5@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>Dear Fran?ois Perrad,
>
>On Sat, 8 Feb 2014 09:18:08 +0100, Fran?ois Perrad wrote:
>> 2014-02-07 21:50 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
>> > Hi Fran?ois,
>> >
>> > On Fri, Feb 7, 2014 at 9:55 AM, Francois Perrad <fperrad@gmail.com> wrote:
>> >> cpanminus was marked as broken, now it becomes useless with the Perl infrastructure.
>> >>
>> >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> >> ---
>> >>  package/Config.in              |    1 -
>> >>  package/cpanminus/Config.in    |   40 ----------------------------------
>> >>  package/cpanminus/cpanminus.mk |   47 ----------------------------------------
>> >>  3 files changed, 88 deletions(-)
>> >>  delete mode 100644 package/cpanminus/Config.in
>> >>  delete mode 100644 package/cpanminus/cpanminus.mk
>> >>
>> >
>> > Shouldn't we add an entry in Config.in.legacy for the removed symbol?
>> >
>> 
>> Perhaps, we could do an exception.
>> The log of package/cpanminus/Config.in contains only 2 entries :
>> *     cpanminus: mark as broken    Thomas Petazzoni    2012-11-16
>> *     cpanminus: new package    Francois Perrad    2012-11-03
>
>I agree with Fran?ois. cpanminus was marked as broken very quickly
>after it was introduced, and broken packages cannot be selected in
>menuconfig. cpanminus has never been selectable in any Buildroot
>stable release, so there is no need to keep compatibility.
>

That's ok for me too...
