From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 21:44:09 +0100
Subject: [Buildroot] [PATCH 1/6] Makefile: rename USER_HOOKS_EXTRA_ENV
 to EXTRA_ENV
In-Reply-To: <75d9eefa9b8ce7e393b6283b80fe7f1e6129db42.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <75d9eefa9b8ce7e393b6283b80fe7f1e6129db42.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5A199.7000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> From: "Yann E. MORIN"<yann.morin.1998@free.fr>
>
> This variable contains extra envirnoment variables that we can not export
> since they are clashing with some build systems (eg. BUILD_DIR with
> u-boot).
>
> So, we may need these variables for other ueses than the user's hooks
> for instrumentation. For example, we'll use them later on to export
> BUILD_DIR to the download helper scripts.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
