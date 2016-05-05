From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 19:31:48 +0200
Subject: [Buildroot] Xorg crash
In-Reply-To: <572B59A9.2070602@zacarias.com.ar>
References: <1274ad69-0abb-26b0-b623-67de78c0274f@brickedbrain.com>
 <572B59A9.2070602@zacarias.com.ar>
Message-ID: <20160505193148.721ba349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 11:33:13 -0300, Gustavo Zacarias wrote:

> Try using BR2_OPTIMIZE_2=y and rebuild everything - the X server is 
> notoriously fragile when optimizing for size with certain toolchain 
> combinations/architectures.

Should we:

 (1) Switch to -O2 as the default optimization level ?

 (2) Force -O2 for the X.org server ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
