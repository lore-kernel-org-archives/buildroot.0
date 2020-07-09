From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 09 Jul 2020 07:33:50 +0300
Subject: [Buildroot] Missing autobuild daily reports
In-Reply-To: <20200704103446.6c9215f4@windsurf.home>
References: <87sgea6tp1.fsf@tarshish> <20200704103446.6c9215f4@windsurf.home>
Message-ID: <873661joi9.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 04 2020, Thomas Petazzoni wrote:
> On Thu, 02 Jul 2020 14:29:46 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
>
>> The last autobuild report was sent on June 26:
>> 
>>   http://lists.busybox.net/pipermail/buildroot/2020-June/285725.html
>> 
>> I find these daily reports useful.
>
> I had a look: I updated my server on June 27 to a newer Ubuntu version,
> and the _mysql Python module that the script is using is no longer
> available. I haven't immediately seen if _mysql was still available in
> some other package, so I'll probably have to adjust the code to use
> another MySQL Python module.

Thanks. It looks like you fixed the issue, but it somehow broke again
after two days:

  http://lists.busybox.net/pipermail/buildroot/2020-July/286004.html
  http://lists.busybox.net/pipermail/buildroot/2020-July/286018.html

Unrelated to that, there appears to be at least one low hanging
patchwork entry that could significantly improve autobuilder stats:

  http://patchwork.ozlabs.org/project/buildroot/patch/20200623101533.1459806-1-stefan.sorensen at spectralink.com/

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
