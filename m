From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 28 Jan 2021 07:25:25 -0600
Subject: [Buildroot] [PATCH] package/uboot-tools: drop redundant
 parentheses
In-Reply-To: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
References: <e66442f596117c0b73f9e43ee838688a1563164c.1611837218.git.baruch@tkos.co.il>
Message-ID: <CANQCQpY-CvqkObWbevEr4GtoaNMfGgXLgt1HAPMvgYehkOyhFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,


On Thu, Jan 28, 2021 at 6:34 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Commit d8db91fc6fa ("package/uboot-tools: resolve host uboot env/script
> error") introduced closing parentheses that is not matched and not
> needed.
>
> Fixes:
> http://autobuild.buildroot.net/results/a65/a65fcc581f56ef70154f83e80f12d64f2e0f856a/
> http://autobuild.buildroot.net/results/39a/39aabb9d8afcdead1d620e081d2cd43ee2d61fbc/
>

Opps, I'll have to check with Kalpesh as we must have only tested the
env binary portion for v2 of the previous series.  Thx for sending the
patch.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
