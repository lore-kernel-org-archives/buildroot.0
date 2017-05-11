From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:14:19 +0200
Subject: [Buildroot] Altera SoC Buildroot external toolchain
 incompatible error
In-Reply-To: <1494532269551-164744.post@n4.nabble.com>
References: <1494532269551-164744.post@n4.nabble.com>
Message-ID: <20170511221419.1e5e9baf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 12:51:09 -0700 (PDT), lemonoje wrote:

> Incorrect ABI setting: EABI selected, but toolchain is incompatible

Your toolchain is an EABIhf toolchain, but you have selected EABI in
your Buildroot configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
