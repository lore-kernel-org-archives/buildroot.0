From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 05 Nov 2012 14:28:27 +0200
Subject: [Buildroot] [git commit] package: drop games/ subdir
In-Reply-To: <5097AE66.1080607@mind.be>
References: <20121105081344.74B5F99BE5@busybox.osuosl.org>
 <5097A1CD.30009@petroprogram.com> <5097AE66.1080607@mind.be>
Message-ID: <5097B0EB.9060108@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

5.11.2012 14:17, Arnout Vandecappelle kirjoitti:
> On 11/05/12 12:23, Stefan Fr?berg wrote:
>> 5.11.2012 9:23, Peter Korsgaard kirjoitti:
>>> commit:
>>> http://git.buildroot.net/buildroot/commit/?id=9b809e1a6ad2a82bfe0d2383f69f45ae8c6283bb
>>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>
>>> As discussed during the dev day.
>
>  Looks like I was distracted when it was discussed, because I didn't
> write it in the
> report. But that's probably not really needed anymore...
>
> [snip]
>> Aww...
>>
>> And I had just finished porting dosbox, DOS emulator that can run old
>> classic DOS games
>> and programs, to buildroot.
>>
>> No games for buildroot developers/users then ?
>
>  It just moved out of the games/ subdirectory, e.g. package/doomwad
> instead of
> package/games/doomwad.
>
>  The general idea is that the subdirectories are confusing and we want
> to get
> rid of them.
>

Ah, I see.

Well, you are right.
They can be a little confusing.

For example, when I start porting some fresh stuff to buildroot the
first thing I usually do is just throw them under the dir named "hacking"
:D

And only afterwards I start wondering what belongs to what subdir.

Best regards
Stefan

>  Regards,
>  Arnout
>
