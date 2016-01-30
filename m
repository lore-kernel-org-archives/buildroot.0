From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jan 2016 08:55:33 +0100
Subject: [Buildroot] [PATCH] package,
 toolchain: remove BR2_TOOLCHAIN_HAS_GCC_BUG_* options
In-Reply-To: <1454109890-19470-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454109890-19470-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56AC6C75.7010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 00:24, Thomas Petazzoni wrote:
> Quite some time ago, we added the options
> BR2_TOOLCHAIN_HAS_GCC_BUG_58595 and BR2_TOOLCHAIN_HAS_GCC_BUG_58854 to
> indicate if the toolchain was affected by those gcc bugs, which were
> causing build failure with a number of packages.
> 
> With the recent change in the external toolchain logic to provide only
> the latest version of each toolchain "family", all the toolchains
> which were affected by those issues disappeared from Buildroot. Those
> options are no longer being selected anywhere, and being blind
> options, it means their value is always going to be "disabled".
> 
> Conquently, this commit removes those options completely, and updates
> all the packages where they were used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
