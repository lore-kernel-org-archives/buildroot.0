From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 23:09:50 +0200
Subject: [Buildroot] [PATCH v3] Add new package apr-util
In-Reply-To: <1335350616-4277-1-git-send-email-bachmann@tofwerk.com>
References: <1335347635-3937-1-git-send-email-bachmann@tofwerk.com>
 <1335350616-4277-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <201204272309.51623.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 25 April 2012 12:43:36 Rico Bachmann wrote:
> Add package apr-util
> 
> Add the package apr-util to buildroot and adding a patch to
> avoid the failing test APU_FIND_APR

 This is a bit more verbose than necessary :-)

 We usually just have "apr-util: new package" as the subject line and
nothing more in the message.

[snip]
> +APR_UTIL_CONF_OPT = \
> +	--prefix=/usr \
> +	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION)

 The --prefix=/usr is already added by AUTOTARGETS, so is redundant here.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
