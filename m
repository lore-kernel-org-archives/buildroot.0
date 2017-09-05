From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:52:29 +0200
Subject: [Buildroot] [PATCH 1/2] lua: fix pkg-config file
In-Reply-To: <20170731211800.5888-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 31 Jul 2017 23:17:59 +0200")
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
Message-ID: <87lglske3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > When Lua is linked with additional libraries, these libraries should go
 > into the pkg-config file as well.

 > Otherwise, linking swupdate with the lua library fails:

 > ```
 > /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlopen'
 > /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlclose'
 > /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlerror'
 > /home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'
 > ```

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
