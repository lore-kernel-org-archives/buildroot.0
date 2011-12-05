From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 05 Dec 2011 18:19:42 +0000
Subject: [Buildroot] [PATCH 2/9] Copy gdbserver from external toolchain
In-Reply-To: <201110181023.35764.arnout@mind.be>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
 <20111017223226.5638eac7@skate> <201110181023.35764.arnout@mind.be>
Message-ID: <4EDD0B3E.6030408@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/2011 09:23, Arnout Vandecappelle wrote:
>
> On Monday 17 October 2011 22:32:26, Thomas Petazzoni wrote:
>> See also
>>
>>   [PATCH 3/4] debug: provide an option to copy the gdbserver to the
>>   target
>>
>> that I posted on July, 11th 2011.
>
>   Grmbl, I missed that one and I already started improving Will's patch...  I just love wasting my time like that :-/
>
>   [I lost my mail archive so it's a bit difficult to your to the original patch, so I'll put my comment here.]
>
>   I notice that Will has
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDBSERVER),y)
> +LIB_EXTERNAL_LIBS+=libthread_db.so
> which was not there in your patch.  Is it not needed?

Arnout, did you ever finish your changes here? I'd love to see a version 
of this committed to buildroot.

Any testing/review I can do?

Thanks
Will


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
