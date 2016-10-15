From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 21:22:25 +0200
Subject: [Buildroot] [PATCH v1] qt5: bump version to 5.6.2
In-Reply-To: <1476552497-21735-1-git-send-email-ps.report@gmx.net>
References: <1476552497-21735-1-git-send-email-ps.report@gmx.net>
Message-ID: <ca21a13d-a07f-a1f0-230f-31c318a4dc28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 19:28, Peter Seiderer wrote:
> - qt5base: remove obsolete '-no-nis' configure parameter ([1])
> - qt5base: remove  upstream committed patch 0007-Remove-libudev-dependency-from-kms.pro.patch ([2])
> - qt5imageformats: remove upstream committed  patch 0001-tvOS-support.patch ([3])
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=644d0e75240811212ed9fd0c21e3bd05db3ba5db
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
> [3] https://git.buildroot.net/buildroot/commit/package/qt5?id=9a55b996651fdfbc40e202cb4dd725dce624ca91
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (build test of a few packages with mips64el-ctng_n64-linux)

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
