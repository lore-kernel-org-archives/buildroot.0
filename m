From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 28 Oct 2019 11:40:33 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 0.13.1
In-Reply-To: <a56286dc-6f75-e727-bd19-177c25b82d70@railnova.eu>
References: <20191028173011.924689-1-joseph.kogut@gmail.com>
 <a56286dc-6f75-e727-bd19-177c25b82d70@railnova.eu>
Message-ID: <CAMWSM7izvRD1NSi7fziG1nB2dm_Zzbn-FA3dHkBKXuopqMexhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan,

On Mon, Oct 28, 2019 at 10:58 AM Titouan Christophe
<titouan.christophe@railnova.eu> wrote:
>
> Hello Joseph, Asaf and all,
>
> On 10/28/19 6:30 PM, Joseph Kogut wrote:
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >   package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
> >   package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
>
> I also notice that we still have the python-raven package, which is
> phasing out in favor of the Sentry SDK you are bumping here.
>
> See https://forum.sentry.io/t/switching-to-sentry-python/4733 , and
> https://github.com/getsentry/raven-python .
>
> Therefore, I think that we can also remove the python-raven package.
> Or maybe putting it in the Legacy config, stating that users should
> shift to python-sentry-sdk ?
>

I agree, with python-raven losing upstream support, I think we should
also phase it out. However, moving from raven to sentry-sdk does
require code changes, so I do think we should move it to legacy config
before removing it completely. I can send a patch later to do this.

Best,
Joseph
