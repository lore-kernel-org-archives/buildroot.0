From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 14:14:49 +0200
Subject: [Buildroot] external toolchain question
In-Reply-To: <4C920255.80602@carallon.com>
References: <4C910D9F.2060308@carallon.com> <20100915211903.6097235c@surf>
	<4C91CF3F.5050007@carallon.com> <20100916110442.29178d68@surf>
	<4C920255.80602@carallon.com>
Message-ID: <20100916141449.27016940@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Sep 2010 12:41:09 +0100
William Wagner <will_wagner@carallon.com> wrote:

> We could change copy_toolchain_lib_root so that it puts the libraries
> in the corresponding location it finds them in rather than currently 
> searching in three locations but always copying to the specified one.

Absolutely. That's what the code was doing prior to
ecb7642cce36bc68d93f0eee677adc7da538228d.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
