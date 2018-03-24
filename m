From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:40:20 +0100
Subject: [Buildroot] [PATCH 2/2] qemu: add libssh2 optional dependency
In-Reply-To: <29cf408194b46abbbb75c15a833197b226477246.1521571596.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Mar 2018 20:46:36 +0200")
References: <85f6746ec9845fe4c5cd366cdd3345d08771165f.1521571596.git.baruch@tkos.co.il>
 <29cf408194b46abbbb75c15a833197b226477246.1521571596.git.baruch@tkos.co.il>
Message-ID: <874ll5yzpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Make sure that qemu uses libssh2 when libssh2 is enabled, for build
 > consistency.

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
