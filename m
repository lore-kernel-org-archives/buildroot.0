From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 14:03:42 +0000
Subject: [Buildroot] [PATCH] gmp: disable assembly for MIPS r6 ISA
In-Reply-To: <1448371947-30575-1-git-send-email-gustavo@zacarias.com.ar>
References: <1448371947-30575-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56546E3E.7000903@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 24/11/15 13:32, Gustavo Zacarias wrote:
> It's still not supported/implemented, fixes:
> http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS64R6 with all direct dependencies of gmp package.

Regards,

Vincent.
