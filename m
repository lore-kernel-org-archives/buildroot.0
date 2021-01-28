From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:18:46 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: drop redundant
 parentheses
In-Reply-To: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 Jan 2021 14:33:38 +0200")
References: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
Message-ID: <87mtwszuft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit d8db91fc6fa ("package/uboot-tools: resolve host uboot env/script
 > error") introduced closing parentheses that is not matched and not
 > needed.

 > Fixes:
 > http://autobuild.buildroot.net/results/a65/a65fcc581f56ef70154f83e80f12d64f2e0f856a/
 > http://autobuild.buildroot.net/results/39a/39aabb9d8afcdead1d620e081d2cd43ee2d61fbc/

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Cc: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
