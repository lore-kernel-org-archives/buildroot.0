From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:03:53 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-backcall: new package
In-Reply-To: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
References: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420220353.54351a24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 19 Apr 2019 11:19:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Specifications for callback functions passed in to an API.
> 
> https://github.com/takluyver/backcall
> 
> No license source files are provided from current version, however
> upstream added one:
> https://github.com/takluyver/backcall/blob/master/LICENSE
> 
> python-backcall is a runtime dependency of python-inotify 7.3.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-backcall/Config.in            |  6 ++++++
>  package/python-backcall/python-backcall.hash |  3 +++
>  package/python-backcall/python-backcall.mk   | 14 ++++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/python-backcall/Config.in
>  create mode 100644 package/python-backcall/python-backcall.hash
>  create mode 100644 package/python-backcall/python-backcall.mk

I've applied the series to master, thanks. On python-parso and
python-jedi, I added BSD-3-Clause to the list of licenses, as it was
the license of the flask theme. I have also added Python-2.0 in the
list of licenses for python-parso, according to what was mentioned in
one of the license files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
