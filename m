From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2013 14:18:21 +0100
Subject: [Buildroot] [PATCH v9 1/8] package: add base dependency to
	every package
In-Reply-To: <1384526422-30142-2-git-send-email-fabio.porcedda@gmail.com>
References: <1384526422-30142-1-git-send-email-fabio.porcedda@gmail.com>
 <1384526422-30142-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5288C21D.3050809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/13 15:40, Fabio Porcedda wrote:
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

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
