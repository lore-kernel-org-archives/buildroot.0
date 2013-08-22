From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 18:11:37 +0200
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
In-Reply-To: <CAAXf6LXSo5Z56BO611E1iv5WUzvtzH+0Ocvr6LD3vSanmrLHkw@mail.gmail.com>
References: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
 <CAAXf6LUO9M-Nghy8ZVMS7L0y2J+=3G6kw1eJKnMUhWOt9wGg4Q@mail.gmail.com>
 <CANxTyt5Q_NG1mzdq4vZJq7dYMjmbbRoAViJ-qi4qhy4LgjYZ0g@mail.gmail.com>
 <CAAXf6LXSo5Z56BO611E1iv5WUzvtzH+0Ocvr6LD3vSanmrLHkw@mail.gmail.com>
Message-ID: <52163839.5060204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/08/13 15:59, Thomas De Schampheleire wrote:
>> >I'd be willing to go through all of them and make them uniform, if
>> >recommended guidelines can be stated with regards to the above variations.
>> >Tabs are tempting only because it's a single character in text files that go
>> >in the target - otherwise, I'm normally in the tabs-are-evil camp, since
>> >thing which start out with tabs tend get modified with spaces over time, and
>> >because editor rendering of tab width can vary.  So I'd be willing to go
>> >either way.
> Thanks for checking. Seems there was more variance than I expected.
>
> I'm not sure what to do here. Unless such init scripts have been
> copied from elsewhere (in which making cosmetic changes may be
> undesirable), I'm ok with having them changed according to a given
> guideline.

  If it is copied from elsewhere then it probably shouldn't be in 
buildroot, but just copied from elsewhere.


> Before trying to establish such a guideline, what does the community
> think about this?
> If there is no consensus in changing, then no need for a guideline.

  I guess that's a judgement call for Peter to make.

  Note that we also have this kind of whitespace inconsistencies in e.g. 
support/scripts.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
