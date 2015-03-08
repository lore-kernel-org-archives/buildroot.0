From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Mar 2015 08:28:44 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <20150308081520.1a6e9fc7@free-electrons.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
 <20150307173234.57c8bf4f@free-electrons.com>
 <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
 <20150308081520.1a6e9fc7@free-electrons.com>
Message-ID: <CAHkwnC9VfqeHc8SGqwJJu777npQ7brMi=B=Ck6rv6CQUyTHB2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2015 at 8:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Sat, 7 Mar 2015 18:01:41 +0100, Fabio Porcedda wrote:
>
>> I don't know exactly but the libevas seems dead, the last change in
>> the git repository was made 15 months ago.
>
> The EFL stuff in Buildroot needs a complete update: most of the
> EFL libraries have been merged into one single project/tarball. So many
> of the EFL related packages in Buildroot should be removed, and the
> main EFL library bumped to a higher version.
>
>> https://git.enlightenment.org/legacy/evas.git/
>
> See the "legacy" in this URL ?


I understand that is a legacy repository but because you talked about
to send a patch upstream i was trying to understand if there is any
chance that the patch will be accepted.

So when you have talked about to send the patch upstream didn't know
about the legacy status of this repository?

Nevertheless the https://git.enlightenment.org/legacy/imlib2.git/
repository gets updated even if it has the "legacy" word in the
prefix, but it's the only one so maybe it's just an exception.

BR
-- 
Fabio Porcedda
