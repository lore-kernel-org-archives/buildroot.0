From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Jan 2012 13:27:36 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <1326975728-25580-1-git-send-email-arnout@mind.be>
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
 <1326975728-25580-1-git-send-email-arnout@mind.be>
Message-ID: <201201191327.37010.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 19 January 2012 13:22:08 Arnout Vandecappelle (Essensium/Mind) wrote:
> +   bash_cv_printf_a_format=yes

 Actually this one depends on UCLIBC_HAS_HEXADECIMAL_FLOATS, so maybe that 
should be kept as a configure option?

 BTW there are still a lot of other warnings in the bash configure, but I
don't think they remove features from the resulting executable.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
