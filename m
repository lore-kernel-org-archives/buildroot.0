From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Mar 2014 19:00:36 +0100
Subject: [Buildroot] [PATCH v4 1/2] eigen: follow default installation
 scheme
In-Reply-To: <1395244134-32329-1-git-send-email-d.viti@infosolution.it>
References: <1395244134-32329-1-git-send-email-d.viti@infosolution.it>
Message-ID: <20140319190036.1cec2a07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Wed, 19 Mar 2014 16:48:53 +0100, Davide Viti wrote:
> eigen's build-system (cmake), by default, installs the header files
> in /usr/include/eigen3

I must have missed something, but if eigen's build-system is cmake, why
do we use generic-package and do the installation manually, instead of
using cmake-package?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
