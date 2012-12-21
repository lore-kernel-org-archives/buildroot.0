From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 21 Dec 2012 15:15:25 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: rename cross target ->
	toolchain
In-Reply-To: <50D4594F.7010402@mind.be>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
 <50D4594F.7010402@mind.be>
Message-ID: <CAHkwnC8mnUS7wkPfLX6=rRVo-12BVVXf+sqddLRxpxv2_BVLcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 21, 2012 at 1:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 21/12/12 11:36, Fabio Porcedda wrote:
>>
>> - Use a more descriptive name, the same of the "toolchain" directory.
>> - Add missing dependencies to be able to successfully use the target
>>    right after the configuration.
>> - Move to a better position.
>> - Documentation it in the help target.
>>
>> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  (not tested but it's trivial enough)
>
>  Some additional suggestions (for additional patches):
>
> - Document it in the manual.
>
> - Add toolchain as a dependency to $(1)-configure for target-packages;
> this makes it possible to remove it from the dependencies of 'world' and
> brings us a step closer to top-level parallel build.

Thank for the review.

I like your suggestions.
I will work on that for additional patches.

Best regards
--
Fabio Porcedda
