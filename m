From: Alex Bradbury <asb@asbradbury.org>
Date: Thu, 9 Aug 2012 10:19:13 +0100
Subject: [Buildroot] [PATCH] yasm: New package
In-Reply-To: <20120809103419.076cadd9@skate>
References: <5022CB63.9020908@petroprogram.com> <20120809103419.076cadd9@skate>
Message-ID: <CA+wH296nvty=7c5xyXyb0mhPwtX4vU8HVLpL6t_=HUd3nzTyag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 August 2012 09:34, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> You shouldn't include "personal" messages in the commit log here. This
> part of the commit log will remain forever in the Git history, so we
> don't want to have messages like "Hopefully it went right...".
>
> If you have something to say beyond the commit log itself, then I think
> the easiest solution is to use git send-email --compose, which will
> prompt you for the text of an introduction e-mail. Then git send-email
> will send N+1 e-mails: your introduction e-mail + the N patches you
> told send-email to send. And git send-email is smart enough to make
> those N emails replies to the introduction e-mail.

Alternatively you can put text that won't be included in the commit
log after the first `---` and before the diffstat, which seems more
appropriate for a standalone patch.

Alex
