From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 19 Oct 2015 11:27:13 -0500
Subject: [Buildroot] [[PATCH v4] 1/1] nwipe: new package
In-Reply-To: <20151019162250.GA3651@free.fr>
References: <1445264296-24025-1-git-send-email-chaduffy@cisco.com>
 <CAMQcK5JMGp6MJXGAtxeeR5-Fb=v31LB3C7iWREd+GeZhy1P3sA@mail.gmail.com>
 <20151019162250.GA3651@free.fr>
Message-ID: <CAMQcK5L5PSNoD8Bwe7_8_o6snVEwYU4Wyi-=bwt8QBYkAKohRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Charles, All

On Mon, Oct 19, 2015 at 11:22 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ryan, All,
>
> On 2015-10-19 11:01 -0500, Ryan Barnett spake thusly:
>> On Mon, Oct 19, 2015 at 9:18 AM, Charles Duffy <charles@dyfis.net> wrote:
> [--SNIP--]
>> > diff --git a/package/nwipe/nwipe.hash b/package/nwipe/nwipe.hash
>> > new file mode 100644
>> > index 0000000..f66b5c3
>> > --- /dev/null
>> > +++ b/package/nwipe/nwipe.hash
>> > @@ -0,0 +1 @@
>> > +sha256 63a3f5fbcaf0c013790345ece2cf04c3d85a15c4505b9d92dc779465aafbd52f  nwipe-8a9a71822148cb9c82d971030dafd8d374fd1f48.tar.gz
>>
>> I don't think we can have a hash file for packages that are pulled from github.
>>
>> Yann - is this correct understanding of the hash file?
>
> This was correct until the beginning of October. You're out of sync!
> Hahaha! ;-)

Well it only took me 19 days to get caught up ;)

> It seems that Gituhb is now providing stable archives, so we decided to
> now require hashes even for archives from Github.

Thanks for the clarification [which is why I differed to you to clarify :)]!

> However, this means that can only be locally computed hashes, so must be
> explicitly said so:
>
>     # Locally computed (from github helper):
>     sha256  XXXXX  foo-x.y.z.tar.gz

Charles - could you please add this comment that Yann described above
to the .hash file?

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
