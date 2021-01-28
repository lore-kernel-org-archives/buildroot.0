From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 19:32:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: resolve uboot env
 source file error
In-Reply-To: <20210125145742.42460-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Mon, 25 Jan 2021 08:57:41 -0600")
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
Message-ID: <87o8h83oay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
 > If Target u-boot is not available, the host build of uboot-tools
 > requires user to provide u-boot environment source file.
 > This change resolves a missing parentheses and updates the comment
 > for the same.

 > Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
