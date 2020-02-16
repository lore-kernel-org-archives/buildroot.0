From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 20:38:39 +0100
Subject: [Buildroot] [PATCH 1/3] package/qemu: Bump to version 4.2.0
In-Reply-To: <20200206190416.48560-1-aduskett@gmail.com> (aduskett's message
 of "Thu, 6 Feb 2020 11:04:14 -0800")
References: <20200206190416.48560-1-aduskett@gmail.com>
Message-ID: <87lfp2e30g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Other changes:
 >   - Remove upstream patches
 >   - Update COPYING.LIB hash as upstream updated the file to match the new LGPL
 >     2.1 license from upstream. See:
 >     https://github.com/qemu/qemu/commit/f0d44cc4462f112bce5ec556e87eff4eec682e39

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed after fixing the libssh2/libssh change, thanks.

-- 
Bye, Peter Korsgaard
