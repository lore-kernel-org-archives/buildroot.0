From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 15 Oct 2014 20:44:49 +0200
Subject: [Buildroot] google-breakpad experiences?
In-Reply-To: <543E8D2E.70404@carallon.com>
References: <CAAXf6LWEBuVmnXosLpkjw0O9aVvGCBE2s=9e1PN6W5S7pK98+g@mail.gmail.com>
 <543E8D2E.70404@carallon.com>
Message-ID: <CAAXf6LVFqiMj0H0P_Qfpkeobrkb=28Art8_d2ga_-SOd8M5Baw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

On Wed, Oct 15, 2014 at 5:05 PM, Will Wagner <willw@carallon.com> wrote:

> We have successfully been using google-breakpad for a few years. However it
> is only on x86 and arm targets and we have our own internal package (it
> pre-dates the one now upstream but is broadly similar, we have a number of
> custom patches as well).
>
> Are you trying to generate dumps within the crashed process or are you
> running the crash server? We have found the latter to be much more reliable.

Currently I'm simply trying the test program described at:
https://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide

which is dumping from within the crashed process.

How does this crash server work? I must say the documentation of
google-breakpad is not very extensive.

Could you also elaborate on the unreliabilities you have encountered
with the first method?

Thanks,
Thomas
