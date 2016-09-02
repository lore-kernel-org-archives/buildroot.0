From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 2 Sep 2016 11:21:29 -0300
Subject: [Buildroot] [PATCH] supertuxkart: Constrain to x86 architecture
In-Reply-To: <20160902143619.3d2d0774@free-electrons.com>
References: <20160901194429.11761-1-ezequiel@vanguardiasur.com.ar>
 <20160902143619.3d2d0774@free-electrons.com>
Message-ID: <CAAEAJfBQdOj6ee46_r3qqu6=3_km_RfBM6t1nfwE9MnAop_2Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 September 2016 at 09:36, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu,  1 Sep 2016 16:44:29 -0300, Ezequiel Garcia wrote:
>> Our build system has detected that angelscript can't be
>> cross-compiled properly. This has been also reported to
>> supertuxkart [1], and although the developers were open
>> to take patches fixing STK embedded angelscript, it was
>> pointed out that non-x86 architectures were not officially
>> supported and of little interest [2].
>
> If it's indeed that angelscript doesn't cross-compile properly, then,
> it also needs to be limited to x86/x86_64 as the host compiler, no?
>
> I.e: what happens if I'm using Buildroot on a PowerPC or ARM machine?
>

Totally right. I just sent a v2.

Thanks,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
