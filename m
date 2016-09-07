From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Sep 2016 11:44:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2016-09-05
In-Reply-To: <20160907092112.GC5600@free.fr>
References: <20160906063035.18941102741@stock.ovh.net>
 <CAFOYHZD8bOuN_2ie0t3O8XJA1zBJck4=YiyCSEVp=iNpPc43dg@mail.gmail.com>
 <20160907092112.GC5600@free.fr>
Message-ID: <20160907114404.64fd14dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Sep 2016 11:21:12 +0200, Yann E. MORIN wrote:

> Then you need to make it depend on host-python (or host-python3).

Or better, fix the script so that it is really Python 2.6 compliant, as
I suggested.

Depending on host-python or host-python3 should really be a last
resort solution IMO, when the Python code cannot be fixed to be Python
2/3 compliant.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
