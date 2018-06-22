From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 19:09:44 +0200
Subject: [Buildroot] [PATCH] imx-usb-loader: make the byte swap macro
 more robust
In-Reply-To: <4dfbf2f59dc79aa360a50cc7cee0dc05daaf1065.1529667845.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 22 Jun 2018 14:44:05 +0300")
References: <4dfbf2f59dc79aa360a50cc7cee0dc05daaf1065.1529667845.git.baruch@tkos.co.il>
Message-ID: <87y3f6kasn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The local 16-bit byte swap implementation that was introduced in commit
 > b05f8f439681 (imx-usb-loader: fix build with older gcc) is not robust
 > enough. It suffers from double evaluation, and operators precedence
 > breakage. Use a better implementation suggested by Arnout Vandecappelle.

 > Cc: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
