From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 2 Jul 2014 10:37:59 +0100
Subject: [Buildroot] [PATCH] binutils: Use the default version by default
In-Reply-To: <1404293385-56160-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1404293385-56160-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <53B3D2F7.8080508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/2014 10:29 AM, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
> ---

Hi Vincent,

The title (or the commit message) could have been a little more accurate
now that I read it again. Your change changes the default version for
MIPS so the commit message should have been clearer. Perhaps

"Use the default version on MIPS"

-- 
markos
