From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:56:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/slang: bump version to 2.3.1a
In-Reply-To: <20170913113804.6391-1-bernd.kuhls@t-online.de>
References: <20170913113804.6391-1-bernd.kuhls@t-online.de>
Message-ID: <d1afd814-43dd-c861-d14d-582ca393d903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 13:38, Bernd Kuhls wrote:
> Switched to bz2 tarball, upstream does not provide a gz tarball anymore.
> 
> Rebased 0001-slsh-libs.patch according to
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/slang/files/slang-2.3.1-slsh-libs.patch
> 
> Removed patches applied upstream:
> 0002-Enable-a-statically-linked-version-of-slsh.patch
> 0003-Disable-module-support-in-the-statically-linked-version-of-slsh.patch
> 0005-make-install-static-do-install-pkgconfig-as-install-.patch
> 
> Removed 0004-Rename-posix_close-function-to-posix_close_slfile.patch
> after upstream committed a different solution, Alpine Linux did the
> same when bumping to 2.3.1:
> https://git.alpinelinux.org/cgit/aports/commit/main/slang?id=d4d252e4dea77c868259b0ef1f3d9cfbe6dc2152
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


 Applied to master, thanks. I also added a sha256 hash and a hash for the
license file.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
