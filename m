From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Aug 2015 10:12:55 -0300
Subject: [Buildroot] configs/marvell_ca9_armv7_le_hfp_defconfig
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD913B@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD9109@svr-wa-exch1.atg.lc>
 <55C265C2.6060608@zacarias.com.ar>
 <944894A3EB1D044A9003B2F944389BB20474AD913B@svr-wa-exch1.atg.lc>
Message-ID: <55C35D57.8000501@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/15 17:47, Lee, Tommy wrote:

> Gustavo,
>
> Please view my replies.
>
> Tommy

Hi Tommy, try keeping the list on CC, someone else might be interested 
or elaborate more.

> Can you point to the exact location in the manual (say, page in the
> online pdf) where this is so?
>
> Page 4/25.
>
> Or if it's in the old (Marvell) buildroot then it likely doesn't apply
> to current releases - new features, cleaning up and other factors can
> change that, manuals are normally attached to explicit buildroot releases.
>
> The path to the manual.pdf is ?/
> buildroot-2015.05/docs/manual/manual.pdf. Last week I sued this PDF and
> succeeded in the make process with the external
> marvell_ca9_armv7_le_hfp_defconfig.

Hmm i'm still failing to find this in the online documentation at:

http://www.buildroot.net/downloads/manual/manual.pdf

Which as of this writing corresponds to the 2015.05 release.
In fact the pdf isn't shipped with releases and according to what you 
wrote below you've got marvell files in the 2015.05 buildroot dir so 
maybe it's still some old manual?

> With the above information there might be a strategy to include those
> defconfig files into the forthcoming BR release.

Normally defconfigs are submitted by contributors or companies if they 
decide to make them clean/generic/minimal-enough for them to be 
incorporated into buildroot releases.
In the end it's up to someone having hardware to test submitting them, 
maybe you can do that?
Regards.
