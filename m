From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 10:11:30 +0100
Subject: [Buildroot] [PATCH 10/16] package/transmission: improve systemd
 support
In-Reply-To: <CAHXCMM+b4_JKc7+r-nxK+7zYn8qYw-Q7untphGrn8bM4Zn-qKg@mail.gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
 <CAHXCMM+b4_JKc7+r-nxK+7zYn8qYw-Q7untphGrn8bM4Zn-qKg@mail.gmail.com>
Message-ID: <54D090C2.1080601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/15 23:09, Samuel Martin wrote:
> We usually like when option are symetrical, so here, just add:
> <snip>
> else
> TRANSMISSION_CONF_OPTS += --without-systemd-daemon
> </snip>
> 
>  Note that, we usually don't indent variable assignation ;)

 To be more accurate: we normally don't indent the bodies of make conditions.
But the transmission.mk file already violates that principle.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
