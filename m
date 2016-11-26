From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 26 Nov 2016 11:25:26 -0500
Subject: [Buildroot] [PATCH] package/pseudo: update version
In-Reply-To: <d0e8798c-0d61-663c-5293-99f64806e3a7@mind.be>
References: <20161125212248.3540-1-gael.portay@savoirfairelinux.com>
 <d0e8798c-0d61-663c-5293-99f64806e3a7@mind.be>
Message-ID: <20161126162525.jx76zeediwc33klv@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Armout,

On Sat, Nov 26, 2016 at 11:50:45AM +0100, Arnout Vandecappelle wrote:
> 
>  Does this work? From the man page, I understand that the -S option can't be
> combined with starting a program.
> 

Yes this is working fine.

Maybe the man page should be updated :)

The -S options can be used with or without scripts.

See http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/tree/pseudo.c if you want,
 * at line 337 (when pseudo is invoked without script) and
 * at line 412 (when pseudo is invoked with a script (our case)).
