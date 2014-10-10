From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 10 Oct 2014 21:24:10 +0200
Subject: [Buildroot] [PATCH v3] package/mono: new package
In-Reply-To: <20141010204840.4ec4d5d3@free-electrons.com>
References: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141010204840.4ec4d5d3@free-electrons.com>
Message-ID: <CA+TH9VkBYm1viE8=o9Miy8Pb4mGrmUxCdDJZ1rTncSysfbcPiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2014-10-10 20:48 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Fri, 10 Oct 2014 16:23:37 +0200, Angelo Compagnucci wrote:
>
> I still don't understand why you think the build takes place in the
> same folder: the host and target variants of the same package are built
> in separate directories.

Well, this aspect is a little bit obsure for me, I'll rework the
documentation to understand better.

> I'm working on the patches that use a single mono package. There are
> other issues with your patch: host-mono-managed automatically downloads
> monolite, which is bad, as it circumvents the download infrastructure
> of Buildroot. I'll show you an approach to fix that.

Yes, it could be fixed, and if it's mandatory for accepting this
patch, I will work on that!

Thank you!

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
