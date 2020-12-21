From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 10:56:32 +0100
Subject: [Buildroot] [PATCH 1/4 v3] configs/beaglebone_qt5: switch to
 using KMS instead of wayland+weston
In-Reply-To: <65da6c095d6ffc4f3b2c3b34d63e85c6a5aa4ea1.1607810474.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 12 Dec 2020 23:01:23 +0100")
References: <cover.1607810474.git.yann.morin.1998@free.fr>
 <65da6c095d6ffc4f3b2c3b34d63e85c6a5aa4ea1.1607810474.git.yann.morin.1998@free.fr>
Message-ID: <87wnxbpjn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > weston does not work on the ti-sgx SDK, so switch to using KMS directly,
 > and drop the wayland-related config options.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > [yann.morin.1998 at free.fr: split into its own patch]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
