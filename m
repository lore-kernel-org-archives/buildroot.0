From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 23:06:00 +0100
Subject: [Buildroot] [PATCH v2] alsa-utils: fix conflics with pthread.h
In-Reply-To: <1449657888-28957-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 9 Dec 2015 10:44:48 +0000")
References: <87wpsolkqi.fsf@dell.be.48ers.dk>
 <1449657888-28957-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d1uehsc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backport two upstream patches to fix a build failure due to conflicts
 > with pthread.h:

> +++ b/package/alsa-utils/0002-bat-Don-t-pass-incompatible-function-pointers-to-pth.patch
 > @@ -0,0 +1,61 @@
 > +bat: Don't pass incompatible function pointers to

The end of that line somehow got stripped.

Committed with that fixed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
