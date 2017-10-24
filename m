From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Oct 2017 23:06:39 -0400
Subject: [Buildroot] [PATCH 02/12] tini: new package
In-Reply-To: <20171021154902.37edd1b9@windsurf>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-2-christian@paral.in>
 <20171021154902.37edd1b9@windsurf>
Message-ID: <CA+h8R2qHX8uMM3jn_g9x8p=uKv9zJoG4SVCb7wUTM4R2-1=umA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 21, 2017 at 9:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I don't think we want this. Buildroot already passes -fstack-protector
> globally when BR2_SSP_REGULAR / BR2_SSP_STRONG / BR2_SSP_ALL.

Feel free to disable it, I was copying the build flags from the
project's Makefile.

Best,
Christian
