From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 21:27:53 +0200
Subject: [Buildroot] [PATCH 1/4] evemu: disable tests via evemu
 configure option
In-Reply-To: <1398711632-5831-2-git-send-email-ps.report@gmx.net>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
 <1398711632-5831-2-git-send-email-ps.report@gmx.net>
Message-ID: <535EABB9.1040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 21:00, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It would have been nice to have used evemu-0002-... instead of
evemu-0005-.... It would also have been nice to avoid the [5/8] in the
patch subject. But neither remark is critical.

 Regards,
 Arnout

> ---
>  package/evemu/evemu-0002-disable-tests.patch       | 19 ----------
>  ...005-configure.ac-add-disable-tests-option.patch | 44 ++++++++++++++++++++++
>  package/evemu/evemu.mk                             |  3 ++
>  3 files changed, 47 insertions(+), 19 deletions(-)
>  delete mode 100644 package/evemu/evemu-0002-disable-tests.patch
>  create mode 100644 package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
