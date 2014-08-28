From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 28 Aug 2014 09:28:06 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/uclibc-ng: add support for
	uClibc-ng
In-Reply-To: <20140828070858.GJ12857@waldemar-brodkorb.de>
References: <20140811113124.GA19506@waldemar-brodkorb.de>
 <53FE6512.9050600@mind.be>
 <20140828070858.GJ12857@waldemar-brodkorb.de>
Message-ID: <CAAXf6LX5GY+APsJh-bw8uf4O3u_Qx8=bP4dmjAw4p24tUbrWtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar, Arnout, all,

On Thu, Aug 28, 2014 at 9:08 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi Arnout,
> Arnout Vandecappelle wrote,
>
>>  Hi Waldemar,
>>
>> On 08/11/14 13:31, Waldemar Brodkorb wrote:
>> > uClibc-ng is a spin-off of uClibc. uClibc-ng will do
>> > a 1.0 release really soon. uClibc lacks releases and
>> > the maintainer does not communicate any timeplans for
>> > releases. For more information about uClibc-ng see:
>> > http://www.uclibc-ng.org
>>
>>  What a surprising lack of reaction on this patch! I'd have expected people to
>> welcome this very much...
>
> I haven't thought of many comments, but no reaction was a little bit
> disappointing.

Keep in mind that this was during August, the stabilization month for
2014.08. Personally I tend to ignore any patch that adds features and
will not make it in the release, and focus on
stabilization/documentation alone.
Moreover, since it's the holiday period, not everyone was around.

As we've discussed the uClibc situation several times before, I'm sure
that several core Buildroot developers are interested in the
development of uClibc-ng, and I'm sure we'll be adding support for it
in Buildroot.

>
>>  However, I'll start with immediately burning it to the ground :-) I think the
>> situation of uClibc-ng is very similar to eglibc: it's essentially the same
>> package, just a different version of it. So, instead of creating a whole new
>> copy, I think it's easier to maintain if it is one more uclibc version in
>> package/uclibc/Config.in.
>
> Okay, thanks for the feedback.
>
> In the meantime I started from scratch with the spin-off. See here
> for details:
> http://blog.waldemar-brodkorb.de/index.php?archives/17-English.html&serendipity[lang_selected]=en&serendipity[user_language]=en

Interesting!

I see there is a devel mailing list created, but nothing was sent
there yet (at least according to the archives
http://uclibc-ng.org/pipermail/devel/)
Isn't this type of change (restarting from scratch) something to send
to that list, rather than writing it in a blog?

Best regards,
Thomas
