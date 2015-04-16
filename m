From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Apr 2015 23:42:46 +0200
Subject: [Buildroot] [PATCH 0/1] package/ffmpeg: Fix ranlib check when
 cross-compiling
In-Reply-To: <1429215155-2085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429215155-2085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <55302CD6.3040201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 22:12, Bernd Kuhls wrote:
> Hi,
> 
> this is a different approach to fix the build error.
> Please compare my patch with http://patchwork.ozlabs.org/patch/461843/
> 
> I am not sure what the best fix would be, therefore I have not yet
> sent my patch upstream.

 I'm OK with either solution. I propose that you send your patch upstream, see
how they react, and if it's positive then we go with yours. If they don't accept
it, then I think that not patching (i.e. my solution) is better.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
