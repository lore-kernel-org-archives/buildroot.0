From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Dec 2013 12:11:02 +0100
Subject: [Buildroot] Call for autobuild fixing for 2013.11
In-Reply-To: <20131126142616.64719ad6@skate>
References: <CAAXf6LXwy3HGGX1W9FCcdVCRJSHMT2B=w--xvcsBxqwUXxDjqg@mail.gmail.com>
 <CAAXf6LU1_ybwfA9DGfkq7fGJ17LU5k4cQb=G14rg6oSdNY=WAg@mail.gmail.com>
 <20131126142616.64719ad6@skate>
Message-ID: <CAAXf6LViMHHbhYP2joLTDYg7=KDJ8jHyMYm81COZkNdhH8AG2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, Nov 26, 2013 at 2:26 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sat, 23 Nov 2013 13:56:28 +0100, Thomas De Schampheleire wrote:
>
>> > If you want to fix a particular problem but get stuck, don't
>> > hesitate in sending your findings to the list. Other developers can
>> > try to help you.
>>
>> It's great to see several people sending patches that fix autobuild
>> failures! Let's keep up this work until the end of the month, when
>> 2013.11 is released...
>
> Yes, we've made really good progress here, and it's indeed great to see
> that more people have decided to the play the "let's fix autobuilder
> failures" game :-)
>
> However, I would not say that this effort should stop at the end of the
> month, when 2013.11 is released. When 2013.11 is released, next will be
> merged in master, and we'll have a nice set of new autobuilder failures
> to look at, not to mention the existing ones that haven't been fixed
> yet!

Yes, obviously I did not mean to stop fixing autobuild issues when
2013.11 is released.
In fact, the amount of remaining autobuild issues at the release of
2013.11 was relatively small that it is imaginable that we could close
them all... It would be great if we could reach 0 failures at some
point for a few days. Then any new failure could be attributed to a
recent commit, and should be fixed at once (or the commit reverted).

Best regards,
Thomas
