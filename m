From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:08:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.60.0
In-Reply-To: <1451081406-21991-1-git-send-email-joerg.krause@embedded.rocks>
References: <1451081406-21991-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151226160826.14f0a247@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 25 Dec 2015 23:10:06 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/boost.hash | 6 +++---
>  package/boost/boost.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks. Can you look at some of the recent boost build
failures ?

         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f400db5d90250aaec3f520532ec2982862e66d4f/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b670a88a80fa27fcac6c0486b4dfdd441150b149/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/310e8d50862f6d9c05edaeaa164920309f82d307/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9e6fb854f4dba2f3ea3882cbeb4c1d4ee067f8f4/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a0d320d9a47e381a3795da82d088d147cc27550c/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/449f273cf48f61b17caf4b8c723116d8473bea48/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ea9c953efb38c617b29ff0bdb90971c4b84e001b/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/96c3d0250fa647854ee94cb6b5ec90a29ba1ebc5/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5e646653056ab15bfc25127cd896cd6ebbfd0e31/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c2ded9fd54ecddd17349cebf3fa0f18b662fa8a4/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
