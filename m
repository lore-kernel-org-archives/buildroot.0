From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 09:35:17 +0100
Subject: [Buildroot] [PATCH v2] Revert "tslib: needs kernel headers 3.12"
In-Reply-To: <4ee6b473200b8d56fd395391f706227a05c1fe00.1486619704.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 9 Feb 2017 07:55:04 +0200")
References: <4ee6b473200b8d56fd395391f706227a05c1fe00.1486619704.git.baruch@tkos.co.il>
Message-ID: <87tw83oj7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
 > This reverts commit 7c60211ce38273580f1f8bf5886771406f9899ca.

 > tslib-1.4 removes this dependency.

 > Add upstream patch that fixes input macros declaration for older kernels.

 > The ts_uinput tool requires 3.6 headers; disable for older kernels.

 > Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
 > [baruch: add tslib patch; disable ts_uinput]
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: fix build using older kernel headers

Committed, thanks.

-- 
Bye, Peter Korsgaard
