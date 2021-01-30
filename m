From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:42:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: fix build with nds32
In-Reply-To: <20210129213608.1030271-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 29 Jan 2021 22:36:08 +0100")
References: <20210129213608.1030271-1-fontaine.fabrice@gmail.com>
Message-ID: <875z3evh8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure with dhcpcd due to SECCOMP_AUDIT_ARCH which is used
 > since version 9.3.0 and
 > https://github.com/rsmarples/dhcpcd/commit/a926ee6d8f4eb2f04e01d72664893e3cb95fceca

 > Fixes:
 >  - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
