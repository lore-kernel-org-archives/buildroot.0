From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 06:52:33 +0200
Subject: [Buildroot] [PATCH v4] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <20131010230553.34257465@skate>
References: <CAAXf6LWg8YGG-yv3dvZjqswagBOMV8gmT1XsWz4KOygEbFUtGw@mail.gmail.com>
 <1381427457-25627-1-git-send-email-tjlee@ambarella.com>
 <05215539-a7b2-47a5-a319-100742fdd41a@email.android.com>
 <CAEvN+1gw9BF6tcATOFJeoRLvVXrR2U7y3jO_KSMhNyz5Ka8Zmg@mail.gmail.com>
 <20131010225729.10b89fde@skate>
 <CAEvN+1gD-JZyhfagY8BVgDAYgKq3yHUJQNfsCE-YTqSdpCO=dQ@mail.gmail.com>
 <20131010230553.34257465@skate>
Message-ID: <2c3a1cf7-4515-4b8f-b5c1-d99b078f6dec@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Dear Tzu-Jung Lee,
>
>On Thu, 10 Oct 2013 14:01:40 -0700, Tzu-Jung Lee wrote:
>
>> > i.e, ccache-stats continues to exist, the only difference with your
>> > implementation is that it sits under the same ifeq ($(BR2_CCACHE),y)
>> > condition. It's just a minor nit.
>> 
>> Oops, my bad.
>> Could you help do the inline editing when you merge it?
>
>I'm not the maintainer, so I can't merge patches. But most likely,
>Peter Korsgaard can do it when merging your patch.
>
>Thanks a lot for all your quick updates to this patch!

Yes, I certainly agree with that!

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
