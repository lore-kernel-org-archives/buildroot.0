From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 16 Sep 2009 19:00:26 -0300
Subject: [Buildroot] [PATCH 2/6] Remove the BOARD/LOCAL feature
In-Reply-To: <1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 16, 2009 at 6:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> will later propose a mechanism to add external boards and packages, so
> that our users not willing to get their target-specific or
> package-specific things merged can keep them cleanly separated from
> Buildroot tree.
>

That would be nice. I tried to figure a way to do that, but since
Kconfig doesn't support things like source *.in I couldn't figure a
way.

Kind Regards,
    Thiago A. Correa
