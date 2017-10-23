From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 20:42:19 +0200
Subject: [Buildroot] [PATCH 00/13] New DL_DIR organisation;
 git cache feature
In-Reply-To: <CAGduivyAHYJQ43fGRqGyFBHvUHtqAqLXXz90_gH0nHM4R8+BSw@mail.gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170728003756.3d675656@gmx.net>
 <CAGduivzEGzqMesGqkrKtchK3gDGVa9_3iOVzYZW2RFQfzbw4iw@mail.gmail.com>
 <20171017215649.492791d6@gmx.net>
 <CAGduivyAHYJQ43fGRqGyFBHvUHtqAqLXXz90_gH0nHM4R8+BSw@mail.gmail.com>
Message-ID: <f078c060-2284-7f03-fa76-f7396abf5f80@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 20:24, Maxime Hadjinlian wrote:
> Hi Peter,
> 
> On Tue, Oct 17, 2017 at 9:56 PM, Peter Seiderer <ps.report@gmx.net> wrote:
>> Hello Maxime,
>>
>> On Sun, 30 Jul 2017 18:32:27 +0200, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
>>
[snip]
>>> It's fixed on my branch on github for now.
>> Any updates on this one? Mind to resend an actual version (would like to
>> see this feature integrated into buildroot, tired of waiting for hours
>> in case RaspberryPi kernel/firmware/userland git versions are updated)?
> I think the most "up-to-date" is my branch on Github
> (https://github.com/maximeh/buildroot/tree/git_cache).
> I don't really think it's ready for a review, there's still many bugs
> in there, at least that's what I remember.
> What would really help me is, if you could test this and tell me what
> breaks so I could look it up and try to fix this, this would be a huge
> help !
> If you come up with patches, that's really nice too ;).
> 
> I won't make any promises on the time I can spend on this, we all know
> how this goes.. but that being said, I am still really motivated by
> this feature, I really need it too.

 Maxime, correct me if I'm wrong, but you'd be happy if Peter does a respin of
the series, right?

 It would be nice if we could already apply the first few patches, just to keep
things going.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
