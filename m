From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 18:08:54 +0100
Subject: [Buildroot] [PATCH 1/1] Qt5: update to 5.2.1
In-Reply-To: <20140214152948.424fd251@skate>
References: <1392387539-20142-1-git-send-email-syntheticpp@gmx.net>
 <20140214152948.424fd251@skate>
Message-ID: <53024226.3070108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/14 15:29, Thomas Petazzoni wrote:
> Dear Peter K?mmel,
> 
> On Fri, 14 Feb 2014 15:18:59 +0100, Peter K?mmel wrote:
>> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
>> ---
>>  package/qt5/qt5.mk                                 |   2 +-
>>  .../qt5base-0001-Fix-build-MIPS64-bigendian.patch  |  51 -------
>>  ...-detect-posix_fallocate-at-configure-time.patch | 167 ---------------------
>>  ...kit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch |  35 -----
>>  4 files changed, 1 insertion(+), 254 deletions(-)
> 
> When bumping a package, if some patches are removed, please explain in
> the commit log why they are removed. In this case, it would be good to
> mention that they can all be removed because they have been merged
> upstream.

 If at all possible, add the upstream commit hashes as well. Or in this
case, the Change-Id tags that are already there are sufficient since they
can be grepped for in the logs.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
