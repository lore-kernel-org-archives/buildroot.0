From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jul 2008 09:25:21 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20080708120426.GB30117@cloud.net.au>
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
Message-ID: <d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2008 at 9:04 AM, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Tue, Jul 08, 2008 at 03:13:05AM -0700, ulf at uclibc.org wrote:
>
> Please, did you test before reverting this?
>

Hamish, Peter,

 Ulf is right. You can try building for avr32 and you will see that
configure fails with unknown platform/compiler without this. I tried
it more or less at the same time as Ulf commited, while I was porting
back some google code improvements. If Ulf hadn't committed before me,
I would have.

Kind Regards,
    Thiago A. Correa
