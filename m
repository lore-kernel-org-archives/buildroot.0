From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 01:07:25 +0200
Subject: [Buildroot] [PATCH v2] package/stella: bump version to 5.0.1
In-Reply-To: <1502031148-14106-1-git-send-email-sergio.prado@e-labworks.com>
References: <1502031148-14106-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <fab7680a-be1e-3adb-de08-d2ee957ea6da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sergio,

On 06-08-17 16:52, Sergio Prado wrote:
> Removed 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch, since
> stella now uses -std=c++14 that builds fine when using PPC altivec
> vectorization.
> 
> Update toolchain dependencies to gcc 4.9 since codebase now uses C++14 features.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0e787fd27537e1ff84a76bf71121048596d808a1/
>
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

 I instead applied Bernd's patch to master that just fixes the gcc7 build issue.

 I've applied your patch to the next branch, but updated it to remove Bernd's
gcc7 fix patch again.

 Can you re-test the next branch to verify that this was done correctly?

 Thanks!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
