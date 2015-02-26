From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Feb 2015 22:01:58 +0100
Subject: [Buildroot] [PATCH] package/libsrtp: fix static build only
In-Reply-To: <54EF5F88.6050104@imgtec.com>
References: <1424906225-11543-1-git-send-email-romain.naour@openwide.fr>
 <54EF2D49.8060909@imgtec.com> <54EF5140.8060208@imgtec.com>
 <54EF5F88.6050104@imgtec.com>
Message-ID: <54EF89C6.4020106@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 26/02/2015 19:01, Vicente Olivert Riera a ?crit :
> Hello Romain,
> 
> upstream fixed the problem. Could you please backport this patch instead
> of adding your own?

Ok, I'll mark my patch as rejected in the patchwork and submit another one with
the backported upstream patch.

Thank you for reporting the issue upstream and John Foley for fixing the issue.

Best regards,
Romain

> 
> https://github.com/cisco/libsrtp/commit/b5fad5f893c7f323a8f8e1c512fa48cf6cdb1c8d
> 
> This way we can remove it in the next version bump.
> 
> Regards,
> --
> Vincent
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
