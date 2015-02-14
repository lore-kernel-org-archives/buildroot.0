From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:10:46 +0100
Subject: [Buildroot] [PATCH 4/4] br-reproduce-build: quote all variables
In-Reply-To: <0b43bc60a4856f45924e3814010dc49d0240b1a4.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <0b43bc60a4856f45924e3814010dc49d0240b1a4.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <20150214221046.69bc7075@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Feb 2015 11:52:06 +0100, Yann E. MORIN wrote:

> -wget -O ${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config
> +wget -O "${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config"

How can this work? You're putting both the -O argument and the URL
within the same quotes.

> -wget -O ${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid
> +wget -O "${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid"

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
