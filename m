From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 10:21:48 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/python-esptool: new package
In-Reply-To: <483e9989-ac40-cfdd-de79-78088c70ab89@grinn-global.com>
References: <20191107170504.1327891-1-b.bilas@grinn-global.com>
 <20191107170504.1327891-2-b.bilas@grinn-global.com>
 <20191107235045.667813a1@windsurf>
 <44e04441-7a39-7770-6ce7-6dcc5fee3870@grinn-global.com>
 <20191108094927.49828a98@windsurf>
 <483e9989-ac40-cfdd-de79-78088c70ab89@grinn-global.com>
Message-ID: <20191108102148.720ed8e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 Nov 2019 10:06:31 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:


> I assume that's the same for that comment bellow:
> 
>  > +config BR2_PACKAGE_PYTHON_ESPTOOL
>  > +??? bool "python-esptool"
>  > +??? select BR2_PACKAGE_PYTHON_SERIAL # runtime
>  > +??? select BR2_PACKAGE_PYTHON_PYAES # runtime
>  > +??? select BR2_PACKAGE_PYTHON_ECDSA # runtime  
> 
> Alphabetic ordering.
> 
> but I think it wouldn't be difficult to handle it in the script.

Indeed, the alphabetic ordering here could I suppose be easily handled
by the script.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
