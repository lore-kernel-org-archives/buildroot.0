From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 1 Oct 2014 10:00:37 +0100
Subject: [Buildroot] [PATCH 2/4] package/freerdp: can not build on uClibc
In-Reply-To: <20140930192604.6fab6f24@free-electrons.com>
References: <cover.1411921550.git.yann.morin.1998@free.fr>	<62743afc9fb2eb079bd1a3ff32ebfbf911fd1e16.1411921550.git.yann.morin.1998@free.fr>	<87lhp3sara.fsf@dell.be.48ers.dk>	<54293079.5010507@imgtec.com>
 <20140930192604.6fab6f24@free-electrons.com>
Message-ID: <542BC2B5.80306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/30/2014 06:26 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 29 Sep 2014 11:12:09 +0100, Vicente Olivert Riera wrote:
>
>> I sent this patch 5 days ago to add support for uClibc for this package
>> by applying an upstream patch:
>>
>> http://patchwork.ozlabs.org/patch/392966/
>>
>> Please, take it into consideration. I think it's better to fix the
>> package instead of disabling it.
>
> Agreed.
>
> Can you resend your patch, after taking into account the comments made
> by Yann, and also making sure to re-enable freerdp with uClibc as part
> of this patch (effectively reverting Yann's patch) ?
>
> Thanks,
>
> Thomas

Done: http://patchwork.ozlabs.org/patch/395466/

-- 
Vincent
