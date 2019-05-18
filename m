From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 18:23:52 +0200
Subject: [Buildroot] [PATCH] package/python-socketio: bump version to
 4.0.1
In-Reply-To: <20190517175342.12371-1-sergei.sakhno@gmail.com>
References: <20190517175342.12371-1-sergei.sakhno@gmail.com>
Message-ID: <20190518182352.6a194727@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Serhii,

Thanks for your contribution! See a few comments below that need to be
addressed before we can apply the patch.

On Fri, 17 May 2019 20:53:42 +0300
Serhii Sakhno <sergei.sakhno@gmail.com> wrote:

> ---

We need you to sign-off on our patch, i.e to add a Signed-off-by line
with your name/e-mail. See how other patches on the mailing list look
like, and also
https://buildroot.org/downloads/manual/manual.html#submitting-patches.

> index 659d4d540c..ea6f2359da 100644
> --- a/package/python-socketio/python-socketio.hash
> +++ b/package/python-socketio/python-socketio.hash
> @@ -1,4 +1,2 @@
> -# md5 from https://pypi.python.org/pypi/python-socketio/json
> -md5	44fd24e839dc3102920765f345740646  python-socketio-1.4.1.tar.gz
> -# sha256 calculated by scanpypi
> -sha256	ebd0984d831d602c8ec6d586ecde4466972cc7ed37dbbfe613192864e8263779  python-socketio-1.4.1.tar.gz
> +md5	1c9e30c6a70eaa8176cc1a9fbb51453c  python-socketio-4.0.1.tar.gz
> +sha256	8035604105058195dfa1c8ca1aff0435f08bbbdc3f72bb1f4b81723d129a4ecf  python-socketio-4.0.1.tar.gz

We like to have in the .hash file the source for the hash. Was it
locally generated ? Or most likely it's available on PyPi. By the way,
did you use the ./utils/scanpypi script to update this package ? I
believe this would have preserved the right comments in the .hash file.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
