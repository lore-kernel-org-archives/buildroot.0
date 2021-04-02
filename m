From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 2 Apr 2021 16:28:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-04-01
In-Reply-To: <20210402093047.44ABC60673@smtp3.osuosl.org>
References: <20210402093047.44ABC60673@smtp3.osuosl.org>
Message-ID: <52f9afb0-a015-1ade-9b88-2cadea1beb90@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 4/2/21 11:30 AM, Thomas Petazzoni wrote:
>      or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbe874bc2c0ab4043ad64ccdc05f7ca9ba59c790 |

This is only a reminder, this build failure is fixed by updating or1k 
bootlin toolchain patching it with binutils patches I've added with this 
patch:
https://git.buildroot.net/buildroot/commit/?id=da2c1d9c56b54c6022689c3696cd54ea7282b4d4

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
