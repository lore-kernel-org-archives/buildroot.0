From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 20:04:43 +0200
Subject: [Buildroot] [PATCH 1/1] add python simple template module
In-Reply-To: <1442162503-5817-1-git-send-email-stevecalfee@gmail.com>
References: <1442162503-5817-1-git-send-email-stevecalfee@gmail.com>
Message-ID: <20150913200443.38a3512d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Calfee,

The title of the commit should be:

	python-pyratemp: new package

On Sun, 13 Sep 2015 09:41:43 -0700, Steve Calfee wrote:


> diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
> new file mode 100644
> index 0000000..0abb9e0
> --- /dev/null
> +++ b/package/python-pyratemp/python-pyratemp.hash
> @@ -0,0 +1,4 @@
> +# From http://www.simple-is-better.org/template
> +# Locally calculated:

Having those two comments together do not make sense. Either the hash
is provided by the official upstream website and you should write the
first line, or the hash is not available from the upstream website, in
which case you use a locally calculated hash.

> +sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
> +

Unneeded empty line.

Could you fix those minor issues, as well as Yegor's comment, and send
a v2 version of this patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
