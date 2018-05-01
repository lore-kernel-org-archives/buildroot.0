From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 11:49:41 +0200
Subject: [Buildroot] [PATCH 1/2] cups: fix build without PAM
In-Reply-To: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 30 Apr 2018 22:19:15 +0300")
References: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
Message-ID: <874ljrhfii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch removing MD5 code that builds when PAM is not
 > enabled.

 > Fixes:
 > http://autobuild.buildroot.net/results/48d/48d53bdeceafdbb51756d5c0b9936ce7c98b4ddc/
 > http://autobuild.buildroot.net/results/13c/13cb03a8d0ae215c418fe2520a27b2940efd4a39/
 > http://autobuild.buildroot.net/results/fd3/fd3c56b60bb0411b38dc7279880d1fab7228c20a/

 > Cc: Olivier Schonken <olivier.schonken@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
