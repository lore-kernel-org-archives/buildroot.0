From: Rob Landley <rob@landley.net>
Date: Tue, 20 Dec 2016 12:17:10 -0600
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <20161220092600.2ca96088@free-electrons.com>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
 <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
 <20161220092600.2ca96088@free-electrons.com>
Message-ID: <4f097d57-5ad0-4818-5d4b-9dc4e48c6279@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/2016 02:26 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 20 Dec 2016 01:18:40 -0600, Rob Landley wrote:
> 
>> I cc'd the buildroot list, which only has uClibc-based cortex-m support
>> at the moment. Why do you suppose I did that?
>>
>> Did you want me to send it to the uclibc.org mailing list which hasn't
>> had a single post this month except your announcement of your fork's
>> release? The list where nobody's noticed the chrome browser can't access
>> https://lists.uclibc.org (archives, subscription page, etc) for weeks
>> now? And yes, I publicized that fact when I noticed it:
> 
> Do you realize that the uclibc-ng project has a mailing list?

No, I hadn't noticed. Good to know, I guess?

>> Your fork clearly hasn't fixed any of the structural issues uClibc
>> developed over the years.
> 
> Waldemar has fixed the main problem of uClibc: the lack of regular
> releases, the lack of a responsive maintainer that merges patches.

Bernhard was pretty active in the years right after he became
maintainer. In the long run 10 years of accumulated technical debt was
too much for him, but maybe it'll be different this time.

> Then, from a technical point of view, Waldemar has added new features,
> dropped badly supported architectures, cleaned up a lot of things,
> improved the test suite, and more. There are probably a tons of other
> things to improve in uClibc-ng, but it's just a matter of receiving
> contributions: we can no longer blame the lack of maintainership.

Good luck to him. I have nothing against uclibc-ng the same way I have
nothing against olibc. If I wasn't already regression testing against
glibc, bionic, and musl, I might pay attention to this one.

> [... snip the rest of the text, TLDR ... ]

He asked. :)

Rob
