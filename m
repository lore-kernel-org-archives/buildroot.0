From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 Nov 2012 01:23:07 +0100
Subject: [Buildroot] [PATCH] add new package fxload
In-Reply-To: <1352199012-7746-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1352199012-7746-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <5099A9EB.4070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/12 11:50, J?r?my Rosen wrote:
> Signed-off-by: J?r?my Rosen<jeremy.rosen@openwide.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> v2: Incorporated comments from Arnout,

  Yep, this is the way to separate additional comments from the commit message.

>
> I am not sure about the make install target line,
>
> I would have expected prefix= to be set by the environement, but maybe it is not a standard var name for make...

  Nope.  The usual variable is DESTDIR.  I guess in fxload they have chosen prefix
because it's similar to 'configure --prefix'.

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
