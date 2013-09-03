From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 11:31:40 +0200
Subject: [Buildroot] [PATCH v2] Fix build reproducibility in Make 3.82
In-Reply-To: <1378197941-30752-1-git-send-email-jezz@sysmic.org>
References: <52257E0D.3000100@mind.be>
 <1378197941-30752-1-git-send-email-jezz@sysmic.org>
Message-ID: <5225AC7C.3010205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/13 10:45, J?r?me Pouiller wrote:
> Make 3.82 do not sort anymore result of wildcards (see
> http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260). This may break
> build reproducibility.
>
> This patch sort results of wildcards to ensure reproducibility.
>
> Signed-off-by: J?r?me Pouiller<jezz@sysmic.org>

  You forgot

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

:-)

> ---
>   V2:
>      Add forgotten file support/dependencies/dependencies.mk. Even if it
>      does not make difference for the build result, I prefer to be
>      consistent.

  I agree!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
