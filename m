From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 19:06:42 +0200
Subject: [Buildroot] [PATCH 09/12] nfacct: add new package
In-Reply-To: <1350909989-1012-9-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5086CEA2.20407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/12 14:46, Gustavo Zacarias wrote:
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_LIBNETFILTER_ACCT

  Is the largefile because of the libnetfilter_acct?  IOW, can it be removed
after Yann's _AVAILABLE patch?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
