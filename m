From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 30 Mar 2015 18:59:34 +0200
Subject: [Buildroot] [PATCH] logrotate: Bump version to 3.8.9
In-Reply-To: <20150330175237.530fba0d@free-electrons.com>
References: <1427675556-9240-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <20150330175237.530fba0d@free-electrons.com>
Message-ID: <CA+sos784ChOKF0_Mbzm__caPV3CSmmG0+0R-GfKYdngBktkJXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, Mar 30, 2015 at 5:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Beno?t Th?baudeau,
>
> On Mon, 30 Mar 2015 02:32:36 +0200, Beno?t Th?baudeau wrote:
>
>>  LOGROTATE_DEPENDENCIES = popt host-pkgconf
>> +LOGROTATE_AUTORECONF = YES
>
> Why do we want to autoreconf ?

Because there is no configure script coming with the package, only
configure.ac. Another solution would be to run autogen.sh, which
should avoid the need for 0001-make-autoreconfable.patch (required for
the NEWS and the like files missing error, or these files could be
touched as an alternative post-patch or pre-configure hook).

Best regards,
Beno?t
