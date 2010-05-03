From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 May 2010 12:20:30 +0200
Subject: [Buildroot] gst-plugins-ugly fail to build
In-Reply-To: <4BDEA010.4010509@digi.com>
References: <4BDEA010.4010509@digi.com>
Message-ID: <20100503122030.307ec66f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 3 May 2010 12:06:08 +0200
Javier Viguera <javier.viguera@digi.com> wrote:

> My current setup is latest buildroot (git sha1 0cd0d0647) with external 
> toolchain built with crosstool-NG (arm + eglibc toolchain).

I'm not sure where 0cd0d0647 is, but can you try after applying
http://git.potipota.net/cgi-bin/cgit.cgi/buildroot/patch/?id=566f764523ac2de8dfd87742f63099896c4bb5f6 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
