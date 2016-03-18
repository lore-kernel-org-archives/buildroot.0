From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:11:59 +0100
Subject: [Buildroot] [PATCH] lxc: update comment about the headers >=
	3.0 dependency
In-Reply-To: <1458221651-4573-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 17 Mar 2016 14:34:11 +0100")
References: <1458221651-4573-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twk31of4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since commit 604095fe9bea925f34ea05a5d80efbc3e9ba16f2 ("libcap: add
 > patch to fix build issue with old kernel headers"), libcap builds fine
 > with headers < 3.0, so it is no longer the reason why lxc needs
 > headers >= 3.0.

 > However, lxc uses setns(), which is only available since kernel 3.0,
 > so we simply update the comment next to the dependency so that it is
 > accurate.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
