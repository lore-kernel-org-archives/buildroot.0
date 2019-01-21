From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jan 2019 13:04:46 -0200
Subject: [Buildroot] [PATCH v2] gcc: Enable __cxa_atexit for final GCC
In-Reply-To: <20181129221445.4d68439f@windsurf>
References: <20181116112618.17034-1-abrodkin@synopsys.com>
 <20181129221445.4d68439f@windsurf>
Message-ID: <CAOMZO5Cr-N8guA2hE-PjsOm4uDj67cnmNroKjMvykPZVS2dwbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 29, 2018 at 7:15 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 16 Nov 2018 14:26:18 +0300, Alexey Brodkin wrote:
> > This is what GCC manual says [1]:
> > -------------------------->8----------------------
> > --enable-__cxa_atexit
>
> I've applied to next, but after dropping the "for final GCC" from the
> commit title, since cxa_atexit is now used for both the initial gcc and
> the final gcc.

Could this one be applied to Buildroot stable?

The lack of this patch causes is causing issues on Mesa:
https://www.mail-archive.com/mesa-dev at lists.freedesktop.org/msg212440.html
