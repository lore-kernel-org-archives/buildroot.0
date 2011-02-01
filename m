From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 1 Feb 2011 22:19:19 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: fix upper case
	$(PKG)_SITE_METHOD
In-Reply-To: <20110201220016.5a34b56d@surf>
References: <1296559129-5595-1-git-send-email-bjorn.forsman@gmail.com>
	<20110201213433.1d527342@surf>
	<AANLkTikUX0mZAwBhX=xVYYtmHR8gp1K3cBde=w7wpwhH@mail.gmail.com>
	<20110201220016.5a34b56d@surf>
Message-ID: <AANLkTi=KQKTUX5zSnqzCUMpT8x6JzNbhtNHKzocPiNcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 February 2011 22:00, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 1 Feb 2011 21:51:38 +0100
> Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:
>
>> Maybe, after all, this is a special case where both upper and lower
>> case should work?
>
> Hum, why would it be necessary to accept upper case spelling ?

The BR documentation uses upper case spelling. So currently
implementation != documentation.
