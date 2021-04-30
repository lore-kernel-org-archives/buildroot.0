From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Apr 2021 09:49:45 +0200
Subject: [Buildroot] [PATCH 2/4] boot/opensbi: allow using U-Boot as a
 payload
In-Reply-To: <20210429074636.724046-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 29 Apr 2021 09:46:33 +0200")
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-3-thomas.petazzoni@bootlin.com>
Message-ID: <875z048b52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The opensbi package already allows to use Linux as a payload for
 > OpenSBI, but in some cases, U-Boot as payload is useful. This commit
 > adds a BR2_TARGET_OPENSBI_UBOOT_PAYLOAD option, modeled after the
 > existing BR2_TARGET_OPENSBI_LINUX_PAYLOAD.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
