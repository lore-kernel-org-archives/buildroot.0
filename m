From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:08:52 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <20141122170934.GD4295@free.fr>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr>
Message-ID: <20141122190852.748af912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 22 Nov 2014 18:09:34 +0100, Yann E. MORIN wrote:

> Here are the hashes I computed locally, which you can add as-is to the
> hash file:
> 
> sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
> sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz

Why do we suggest to have two hashes? Isn't sha265 sufficient?

Also, is it necessary to align the different columns? Should it be done
with tabs or spaces? I've seen different solutions being used.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
