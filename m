From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2016 14:38:38 +0100
Subject: [Buildroot] [PATCH 1/1] mxml: add host-autotools-package macro
In-Reply-To: <1458041510-19966-1-git-send-email-ricardo.crudo@gmail.com>
References: <1458041510-19966-1-git-send-email-ricardo.crudo@gmail.com>
Message-ID: <20160315143838.2683f35c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ricardo Crudo,

On Tue, 15 Mar 2016 12:31:50 +0100, Ricardo Crudo wrote:
> Some packages need to process xml at host side

Could you define "some" by giving some examples of package that will
need that?

When possible, we try to avoid having "orphan" host packages, i.e host
packages whose build cannot be triggered at all because no other
packages depend on them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
