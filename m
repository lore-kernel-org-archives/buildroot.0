From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:44:36 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] Replace LIBFOO_CPE_ID_NAME by LIBFOO_CPE_ID_PRODUCT
In-Reply-To: <20210118174151.420304-2-fontaine.fabrice@gmail.com>
References: <20210118174151.420304-1-fontaine.fabrice@gmail.com>
 <20210118174151.420304-2-fontaine.fabrice@gmail.com>
Message-ID: <20210121224436.1df7f6aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 18:41:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace LIBFOO_CPE_ID_NAME by LIBFOO_CPE_ID_PRODUCT to better "comply"
> with the official "Well-Formed CPE Name Data Model" parameters:
>  - https://csrc.nist.gov/publications/detail/nistir/7695/final
>  - https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
> 
> It should be noted that the following parameters could also be replaced
> in following commits to increase compliance with above specification:
>  - LIBFOO_CPE_ID_VERSION_MINOR -> LIBFOO_CPE_ID_UPDATE
>  - LIBFOO_CPE_ID_PREFIX -> LIBFOO_CPE_VERSION (i.e. 2.3) and
>    LIBFOO_CPE_ID_PART (a for applications, o for operating systems or h
>    for hardware)

This second paragraph doesn't really belong to a commit log, as it
talks about "other things that could be done".

So, I dropped this part of the commit, refreshed the patch to take into
account other CPE_ID_NAME variables that were introduced since then,
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
