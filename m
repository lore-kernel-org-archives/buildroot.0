From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 22:48:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/open-plc-utils: install
 packages to /usr/bin
In-Reply-To: <20200617222159.176141-2-aduskett@gmail.com> (aduskett's message
 of "Wed, 17 Jun 2020 15:21:59 -0700")
References: <20200617222159.176141-1-aduskett@gmail.com>
 <20200617222159.176141-2-aduskett@gmail.com>
Message-ID: <87imeoy063.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > By default, open-plc-utils installs all of the compiled binaries to
 > /usr/local/bin which is not in the default path provided by Buildroot.

 > Passing BIN="$(TARGET_DIR)/usr/bin" to make install forces open-plc-utils to
 > install the compiled binaries to /usr/bin.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
