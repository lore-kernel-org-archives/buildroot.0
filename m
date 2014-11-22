From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 22 Nov 2014 21:32:36 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <20141122212416.1f57c59f@free-electrons.com>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr> <20141122190852.748af912@free-electrons.com>
 <20141122185640.GE4295@free.fr> <20141122205900.5aa98365@free-electrons.com>
 <CAGm1_ksOF3MWdjasYp78Xw2O=nH0tbT_jddE0en_F_hnBb=NWg@mail.gmail.com>
 <20141122212416.1f57c59f@free-electrons.com>
Message-ID: <CAGm1_kuYptuts7OxWahX3bKi135bfDYYvEVEu=_PdhQ=Q5cfDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 22, 2014 at 9:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Sat, 22 Nov 2014 21:16:34 +0100, Yegor Yefremov wrote:
>
>> How should I include hash for this package?
>
> Don't worry about the hash for now. I'll commit either one hash or two
> hashes, and I won't really care about the indentation of the hash file.
>
> The real question is the license one.

I'd add this:

PYTHON_CERTIFI_LICENSE = Python code: ISC, cacert.pem: MPL

The certifi author didn't answer my mail request.

Yegor
