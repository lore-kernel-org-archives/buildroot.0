From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2021 08:03:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-pam: drop useless
 LINUX_PAM_CPE_ID_NAME definition
In-Reply-To: <20210114223432.456542-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Jan 2021 23:34:31 +0100")
References: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
 <20210114223432.456542-2-thomas.petazzoni@bootlin.com>
Message-ID: <87lfcufzrm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This definition is useless, because it is equal to the default value
 > of <pkg>_CPE_ID_NAME as calculated by generic-package.

 > Before and after this patch, the CPE ID calculated for the linux-pam
 > package is exactly the same, according to "make linux-pam-show-info".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
