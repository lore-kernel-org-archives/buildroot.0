From: Ash Charles <ashcharles@gmail.com>
Date: Sat, 26 Nov 2016 09:34:44 -0500
Subject: [Buildroot] [PATCH v2 2/3] pru-software-support: add library
 for PRU firmware
In-Reply-To: <20161126150524.476da6e1@free-electrons.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-2-git-send-email-ash.charles@savoirfairelinux.com>
 <1c417375-fe37-9cc8-5747-87c670b3e51f@mind.be>
 <20161126150524.476da6e1@free-electrons.com>
Message-ID: <CAK8F28mpaC9H1MHumziXG6YOnzvhfodTv9fkVP5gAKsSXOctYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Sat, Nov 26, 2016 at 9:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Correct, but they are not checked, so it isn't really obvious today
> that we want to have hashes for git downloads.
>
> But still: please add a locally calculated sha256 hash.
I found the documentation about using 'none'  in section 17.4 of the
buildroot manual [1].  I'll add a patch with some wording to capture
this correction.

Thanks Arnout and Thomas both for the feedback on this series.

[1] https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

--Ash
