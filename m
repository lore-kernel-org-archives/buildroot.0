From: Chris Zankel <chris@zankel.net>
Date: Mon, 12 Nov 2012 15:45:47 -0800
Subject: [Buildroot] [PATCH 2/2 v3] xtensa: support configurable
 processor configurations
In-Reply-To: <50A16B1E.8030703@mind.be>
References: <509d9db2.4883440a.7065.016e@mx.google.com>
 <509DA516.40007@mind.be> <50A169FC.6010708@zankel.net>
 <50A16B1E.8030703@mind.be>
Message-ID: <50A18A2B.1050102@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/2012 01:33 PM, Arnout Vandecappelle wrote:
>
>    Perhaps it's better to move the condition to a
> if BR2_xtensa
> ...
> endif
> around the entire file.  Thomas has a patch lined up to move all
> the conditions outside of the Config.in.*
>> It seems Xtensa would be the only one that uses that scheme, so maybe
>> wait for the generic patch from Thomas?
>   I don't think so. Then it means more work for Thomas to refresh his
> patch.  There will be a merge conflict anyway between the two, but
> with the condition outside the file the conflict will be small.
>
>   That said, Peter hasn't merged Thomas's patch even though I acked
> it, so maybe he has some fundamental objection to the principle.
> Or maybe it's just because I didn't test it.
I guess I don't understand what that patch does, i.e. where is the
'if...endif'? Could you maybe point to the patch?

Thanks,
-Chris
