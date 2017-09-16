From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 15 Sep 2017 17:22:50 -0700
Subject: [Buildroot] [PATCH v3] zstd: bump to version 1.3.1
In-Reply-To: <7c859af274e2f31bbcc7db64b9096d2d7e0e7733.1505479199.git.baruch@tkos.co.il>
References: <7c859af274e2f31bbcc7db64b9096d2d7e0e7733.1505479199.git.baruch@tkos.co.il>
Message-ID: <CAHQ1cqG85EEOJrsr4f3Uij+p0O5YKr=E2UGE9v9SLPjzG8HtVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 15, 2017 at 5:39 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> In this release zstd added the GPLv2 license and removed the PATENTS
> clause (upstream commit 4f73b3b55d83b).
>

Hah! You beat me to the punch, I have/had similar patch sitting in my
own repo that I was going to submit this week.

Builds and runs fine on my setup, so:

Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

NOTE: I did notice that my original patch that added zstd has a bug
where it install tools to "/usr/local/bin" instead of "/usr/bin". I'll
submit a patch to fix that shortly.

Thanks,
Andrey Smirnov.
