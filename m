From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 11 May 2021 13:30:00 +0200
Subject: [Buildroot] [PATCH] package/dt-utils: add patch to fix
 barebox-state lock file
In-Reply-To: <87lf8m6hn2.fsf@grinn-global.com>
References: <20210217185609.1120677-1-b.bilas@grinn-global.com>
 <87lf8m6hn2.fsf@grinn-global.com>
Message-ID: <c0ee5c25-3ee1-ab43-76fd-aadc9d162502@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 10.05.2021 11:51, Marcin Niestr?j wrote:
> Hi,
>
> Bartosz Bilas <b.bilas@grinn-global.com> writes:
>
>> Add patch from the upstream mailing list [1] that fixes
>> the following error when we try to execute barebox-state command:
>>
>> # barebox-state
>> Failed to open lock-file /var/lock/barebox-state
>>
>> [1] https://www.mail-archive.com/oss-tools at pengutronix.de/msg00063.html
>>
>
> Mentioned patch is now part of 2021.03.0 release. I've sent patch 
> updating dt-utils to this version in 
> https://patchwork.ozlabs.org/project/buildroot/patch/20210510092853.1481441-1-m.niestroj at grinn-global.com/.

In that case we can drop this. I will test your patch as soon as I get 
some device that can run barebox on it.

Best
Bartek
>
> -- 
> Regards,
> Marcin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210511/25e3e8fa/attachment.html>
