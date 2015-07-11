From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:56:10 +0200
Subject: [Buildroot] [PATCH 1/7] Add <PKG>_STRIP_COMPONENTS for packages
 with non-standard tarballs
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A19F0A.7010002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Since the cover letter is missing, I'll reply to this one...

On 07/11/15 16:15, Luca Ceresoli wrote:
> Usually package tarballs contain only a directory named
> "<pkg-name>-<pkg-version>" which contains the actual source tree. To properly
> extract the source files in $(BUILD_DIR), Buildroot passes the
> --strip-components=1 option to tar.

 Great work.

 I think the following packages could also be converted:

flite
nvidia-tegra23-codecs

but admittedly, they look a little more complicated.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
