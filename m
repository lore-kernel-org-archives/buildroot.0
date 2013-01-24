From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Jan 2013 09:13:44 -0300
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <5101244C.7080307@petroprogram.com>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
 <20130122180554.6c540102@skate> <50FED7D3.3060600@petroprogram.com>
 <51011175.9010106@zacarias.com.ar> <5101244C.7080307@petroprogram.com>
Message-ID: <51012578.5010308@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/2013 09:08 AM, Stefan Fr?berg wrote:

> I think users should be allowed to do every possible combination they
> want to.
> But also give them big fat warning in cases when their choices might
> drop performance
> so that they are perfectly aware of consequences of the choices they
> made in config.
> So yeah, double (de)compression is option too but with big fat warning
> added that might
> affect your system speed.
> 
> User is the King.

At this point my patchset (v2) does nothing to address the issue, so
it's safe to commit.
I was leaving that functionality for a separate one afterwards if the
consensus is "go for it".
Regards.
