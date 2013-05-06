From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 6 May 2013 10:17:08 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] add daemon mode support to pulseaudio
In-Reply-To: <87ehdmvkqw.fsf@dell.be.48ers.dk>
Message-ID: <1776516174.2211993.1367828228840.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> As we now have support for post-build scripts, we no longer need the
> hack about checking if the script is already present in the skeleton,
> so
> that can be removed.
> 
> Committed with these fixes (and the typos Thomas pointed out),
> thanks.
> 
> Are you actively using pulseaudio? 3.0 got released some months ago,
> care to test and send a patch to upgrade to it?
> 


yes, I have a project using pulseaudio to build a headless remote audio system. i'll give it a try and report my findings
