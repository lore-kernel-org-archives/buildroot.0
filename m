From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 8 Dec 2013 10:43:56 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-07
In-Reply-To: <20131208073009.673C5101507@stock.ovh.net>
References: <20131208073009.673C5101507@stock.ovh.net>
Message-ID: <CAHt8ZCNu8Nwzh1LfD00CQ3CTMsS8NQ51GmdM+9QiRfzg-s_ShQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 December 2013 07:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2013-12-07
> ===============================
>
>         success : 74
>        failures : 63
>        timeouts : 3
>           TOTAL : 140
>
> Classification of failures by reason
> ====================================
>
> gpsd-327a3ef7c83c1b3b2cf7cd... | 26

I've sent patches upstream to fix some of the gpsd build failures. The
3.11 release is expected within days; so, unless there are objections
here, I'll hold off backporting a load of gpsd patches into Buildroot
for the time being.


Simon.
