From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 08:27:43 -0600
Subject: [Buildroot] [PATCH] scanpypi: ignore empty elements in package
 requirements
In-Reply-To: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
References: <1516695187-1193-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CANQCQpZRXFjBo_oyOBWLyB5Nkf9a45RFUhR_6J79UEC818McCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Tue, Jan 23, 2018 at 2:13 AM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Depending on how setup.py reads requirements files empty elements can occur.
> This patch takes care, that such elements will be ignored and don't crash
> the scanpypi script.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I used this new python package for testing
(https://patchwork.ozlabs.org/patch/864829/)

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
