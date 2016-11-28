From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Nov 2016 09:43:15 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-good: add upstream patches to
 fix security issue in flic decoder
In-Reply-To: <20161128041908.eaxfckbxxet3rfhq@tarshish>
References: <20161127214118.2545-1-peter@korsgaard.com>
 <20161128041908.eaxfckbxxet3rfhq@tarshish>
Message-ID: <CACXmViaVjHae78c0CGP3D=3+h3-GZbCn0A2MycLKrFreHKK4aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 28, 2016 at 5:19 AM, Baruch Siach <baruch@tkos.co.il> wrote:

>> Fixes CVE-2016-963{4,5,6}.
>
> The expanded form of this pattern would be nicer to future 'git log --grep'.

True. Committed after fixing this and regenerating the patches with
the -N option, thanks.

--
Bye, Peter Korsgaard
