From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 15 Oct 2013 21:37:27 +0200
Subject: [Buildroot] [PATCH 1/2] python-thrift: fix cross building
In-Reply-To: <OFF9519787.DE83E1FB-ON86257C05.0059A05A-86257C05.005B1951@rockwellcollins.com>
References: <1381853269-25617-1-git-send-email-gustavo@zacarias.com.ar>
 <OFF9519787.DE83E1FB-ON86257C05.0059A05A-86257C05.005B1951@rockwellcollins.com>
Message-ID: <CAAXf6LW9SfFYQjDdxc91tYYML3qAjypeDbR5Vuk6gdpd1U9ohg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Tue, Oct 15, 2013 at 6:35 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
[..]
>
> If this way ensures that setup.py does correctly cross-compile python
> modules, I would like to see this be the standard way we python modules
> are done. As you mentioned on the IRC channel, creating a PYTHON_MAKE_ENV
> variable would be useful which would do the above defines. This way we
> could standardize the way python libraries are build to help ensure
> cross compiling is done correctly.
>
> It seems that every python module does things just a little bit
> differently.

While trying to help someone on IRC with a python module, I also noticed this.
I would definitively be in favor of lining up the different python
modules, either directly or with some kind of infrastructure.

If someone wants to step up and propose something like that, that
would be great!

Best regards,
Thomas
