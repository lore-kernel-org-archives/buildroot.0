From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 7 Oct 2009 10:19:01 -0300
Subject: [Buildroot] [PATCH 05/23] qt: remove Makefile variable QT_QMAKE
In-Reply-To: <1254907246-5650-6-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-6-git-send-email-mroth@nessie.de>
Message-ID: <d6cda7730910070619g53fb85a4hdf862a95a47ac219@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Oct 7, 2009 at 6:20 AM, Michael Roth <mroth@nessie.de> wrote:
> The variable is no longer referenced by any buildroot code and not
> needed by external programs.
>
> Once upon a time there was a problem with 'qmake' not finding its
> spec file. But this problem in gone in the meantime.
>
> Signed-off-by: Michael Roth <mroth@nessie.de>

I use it in at least 3 private packages. It might be that it's not
necessary anymore, I didn't try, but it certainly isn't "unused".

Kind Regards,
    Thiago A. Correa
