From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Nov 2014 08:53:00 +0100
Subject: [Buildroot] [git commit branch/next] package: add python-flask
In-Reply-To: <20141114180459.3437FB24FE@busybox.osuosl.org>
References: <20141114180459.3437FB24FE@busybox.osuosl.org>
Message-ID: <CAGm1_kvTiycx_zKDVju6cRu_6H4748zBYwU-3c_i=HP97CamBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Nov 14, 2014 at 7:00 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=541d9452237ba5fc00a42a0a7e4019518d7ec4ce
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

when trying to import flask with at least Python 2.7.8 I get following error:

>>> from flask import Flask
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "home/user/Documents/versioned/br-test/bsp/target/usr/lib/python2.7/site-packages/flask/__init__.py",
line 19, in <module>
  File "home/user/Documents/versioned/br-test/bsp/target/usr/lib/python2.7/site-packages/jinja2/__init__.py",
line 33, in <module>
  File "home/user/Documents/versioned/br-test/bsp/target/usr/lib/python2.7/site-packages/jinja2/environment.py",
line 13, in <module>
  File "home/user/Documents/versioned/br-test/bsp/target/usr/lib/python2.7/site-packages/jinja2/nodes.py",
line 18, in <module>
  File "home/user/Documents/versioned/br-test/bsp/target/usr/lib/python2.7/site-packages/jinja2/utils.py",
line 520, in <module>
ImportError: No module named markupsafe

werkzeug itself is working, at least I can import it.

Any idea?

Yegor
