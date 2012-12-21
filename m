From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Dec 2012 13:42:55 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: rename cross target ->
	toolchain
In-Reply-To: <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <50D4594F.7010402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/12/12 11:36, Fabio Porcedda wrote:
> - Use a more descriptive name, the same of the "toolchain" directory.
> - Add missing dependencies to be able to successfully use the target
>    right after the configuration.
> - Move to a better position.
> - Documentation it in the help target.
>
> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (not tested but it's trivial enough)

  Some additional suggestions (for additional patches):

- Document it in the manual.

- Add toolchain as a dependency to $(1)-configure for target-packages;
this makes it possible to remove it from the dependencies of 'world' and 
brings us a step closer to top-level parallel build.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
