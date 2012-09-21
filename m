From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 14:11:42 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C5180.10105@zacarias.com.ar>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar>
Message-ID: <505C597E.8020306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 13:37, Gustavo Zacarias wrote:
> host-pkg-config almost always present

  Maybe we should make that _always_ present, and add host-pkg-config to
the toolchain build...  It is more or less part of the toolchain, and it
doesn't hurt to build it if it's not needed.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
