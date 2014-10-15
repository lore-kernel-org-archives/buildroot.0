From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 15 Oct 2014 17:02:37 +0100
Subject: [Buildroot] google-breakpad experiences?
In-Reply-To: <CAAXf6LWEBuVmnXosLpkjw0O9aVvGCBE2s=9e1PN6W5S7pK98+g@mail.gmail.com>
References: <CAAXf6LWEBuVmnXosLpkjw0O9aVvGCBE2s=9e1PN6W5S7pK98+g@mail.gmail.com>
Message-ID: <543E9A9D.2010104@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/2014 15:53, Thomas De Schampheleire wrote:
> Hi,

<snip>

>
> Did any of you succeed in using google-breakpad on embedded targets?

Hi Thomas,

We have successfully been using google-breakpad for a few years. However 
it is only on x86 and arm targets and we have our own internal package 
(it pre-dates the one now upstream but is broadly similar, we have a 
number of custom patches as well).

Are you trying to generate dumps within the crashed process or are you 
running the crash server? We have found the latter to be much more reliable.

Regards
Will


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
