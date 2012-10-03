From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Oct 2012 11:20:35 +0200
Subject: [Buildroot] [PATCH v6] sconeserver: new package
In-Reply-To: <1348215634-6586-1-git-send-email-spdawson@gmail.com>
References: <1348215634-6586-1-git-send-email-spdawson@gmail.com>
Message-ID: <506C0363.7020807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/09/12 10:20, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(build test on ppc with minimal internal toolchain (C++ & WCHAR),
all sconeserver modules enabled, with an explicit 'make sconeserver'
so dependencies are checked as well.)

[snip]
> +SCONESERVER_SITE = \
> +	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk

  I don't like this kind of splitting of lines with many characters but few words.
It's OK to go over the 80 character limit for this kind of thing.

  But that little thing is not enough to warrant a v7 :-)

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
