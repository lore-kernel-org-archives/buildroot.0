From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 09 Jan 2014 18:30:33 +0100
Subject: [Buildroot] [PATCH v10 1/8] package: add base dependency to
	every package
In-Reply-To: <1387363007-19846-2-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52CEDCB9.9090102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/13 11:36, Fabio Porcedda wrote:
> Move "dependencies" "dirs" "prepare" dependencies from "toolchain" to
> every package.
> This way we can build correctly every package right after the clean
> stage.
> As example with this commit we can build successfully the glibc right
> after the clean stage:
> 	make clean glibc
>
> This is also a step forward supporting top-level parallel make.
>
> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>

  Peter,

  This one is fixing a problem reported by a user and has already gone 
through 10 iterations. Can it be committed?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
