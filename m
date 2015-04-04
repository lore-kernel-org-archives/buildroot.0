From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 16:43:17 +0200
Subject: [Buildroot] [RFC] openplc: new package
In-Reply-To: <1412539362-22336-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1412539362-22336-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150404164317.615a1421@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  5 Oct 2014 22:02:42 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> This is sent as an RFC, because I'm really not sure about the patches.
> I will send them upstream as soon as possible.

Applied, after doing a good number of changes:

    [Thomas:
      - rename to open-plc-utils to match upstream name.
      - fix Config.in to use tabs instead of spaces
      - remove 'default n' line
      - add dependency on BR2_USE_MMU
      - bump to a more recent upstream commit
      - remove no longer needed openplc-0002-Remove-vfprintf-call.patch
      - rename patch to the proper naming convention
      - specify <pkg>_LICENSE_FILES
      - pass CROSS= instead of CC=
      - do not pass CC= at install time.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
