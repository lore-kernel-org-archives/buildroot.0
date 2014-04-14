From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 18:04:30 +0200
Subject: [Buildroot] [PATCH v2] openpgm: needs host python2
In-Reply-To: <20140414042425.GA9805@tarshish>
References: <783d7d9db0c782c2317fcfc6160b6802b095164d.1397117772.git.baruch@tkos.co.il>
 <CAHXCMMJF0K+CjZ=gM+quvbAEJyqAfvP3i9bfz_DovzVfQLH+6A@mail.gmail.com>
 <20140414042425.GA9805@tarshish>
Message-ID: <CAHXCMMKcU2mwC7C1Thwho1TgvFcEd0a=ZvNtnCXQo7bhXfGhHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

On Mon, Apr 14, 2014 at 6:24 AM, Baruch Siach <baruch@tkos.co.il> wrote:
[...]
> The print_function feature of __future__ is only available since Python 2.6.
> Should we rely on having such a recent version installed on the host?

I think so. I don't see why a build machine would keep a python
version <2.6, maybe some very old buildfarms (in this case, one may
expect other troubles ;-]).
Anyway, I'll the host-python dependency; if this is rejected, I'll
repost the patch without.

Regards,


-- 
Samuel
