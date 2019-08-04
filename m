From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 04 Aug 2019 13:44:10 +0300
Subject: [Buildroot] [PATCH 1/5] package/python-certifi: bump version to
 2019.6.16
In-Reply-To: <20190804121104.36dc5856@windsurf.home>
References: <20190803204040.341-1-bernd.kuhls@t-online.de>
 <20190804112427.588c793f@windsurf.home> <8736ih8eam.fsf@tarshish>
 <20190804121104.36dc5856@windsurf.home>
Message-ID: <871ry18b2d.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Aug 04 2019, Thomas Petazzoni wrote:
> On Sun, 04 Aug 2019 12:34:25 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
>
>> > Series applied. Thanks!
>>
>> Patch http://patchwork.ozlabs.org/patch/1141604/
>> (package/python-urllib3: bump version to 1.25.3) is not in master as of
>> commit e98fc11afb.
>
> Sorry about that, I indeed messed things up, trying to do to many
> things at once. I now applied the patch for real and pushed it. Thanks
> for noticing!
>
> BTW, Baruch, we're wondering how you notice this kind of things ? Do
> you have some tool that checks this, or your brain is just so good that
> it can detect this kind of mistakes ?

I watch the flow of list emails. I usually delete each "committed"
responses with its matching "git commit" notification. I report
discrepancies that I find, after verification against the git tree.

This case has been pure luck. There was only one "committed" email for
the entire series. I noticed the "1/5" string in subject, but only 4
"git commit" messages. So I went back to patchwork to locate the missing
commit. Finding 1 in 5 patches is not too hard.

I noticed a similar discrepancy in the last license hashes series from
Bernd Kuhls. However, going though 18 patches was too much for me.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
