From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Mar 2012 14:22:44 +0100
Subject: [Buildroot] [PATCH] Ubinize: made UBI volume name and volume
	alignment configurable
In-Reply-To: <1331030879-13141-1-git-send-email-rolandu@gmail.com>
References: <1331030879-13141-1-git-send-email-rolandu@gmail.com>
Message-ID: <201203111422.44384.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 06 March 2012 11:47:59 Roland Uuesoo wrote:
> From: Roland Uuesoo <roland@martem.eu>
> 
> Signed-off-by: Roland Uuesoo <roland@martem.eu>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 A better commit message would be:

ubi: make volume name and volume alignment configurable

Also filled in missing help text for other options.


[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
