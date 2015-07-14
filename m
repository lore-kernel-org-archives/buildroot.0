From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 18:30:11 -0300
Subject: [Buildroot] [PATCH v5 1/6] Makefile: save MAKE_VERSION
In-Reply-To: <55A57DB3.4010806@mind.be>
References: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
 <1436902975-5004-2-git-send-email-gustavo@zacarias.com.ar>
 <55A57DB3.4010806@mind.be>
Message-ID: <55A57F63.2080500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/15 18:22, Arnout Vandecappelle wrote:


>> +# Save running make version since it's clobbered by the make package
>> +RUNNING_MAKE_VERSION = $(MAKE_VERSION)
>
>   Shouldn't this be := instead of = ? Otherwise it will still be clobbered, no?
>
>   Otherwise:
>   Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>   Regards,
>   Arnout

So very true!
I'll send v2, it can be applied separately, albeit before, webkit & minions.
Regards.
