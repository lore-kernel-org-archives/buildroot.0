From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 24 Feb 2011 11:10:36 +0100
Subject: [Buildroot] [git commit master 1/1] makedevs: fix cases where
 (start != 0)
In-Reply-To: <20110223224020.3D7678F626@busybox.osuosl.org>
References: <20110223224020.3D7678F626@busybox.osuosl.org>
Message-ID: <AANLkTi=EH1gbpx_NrRJC8NGCZ+APdJr9j6VVr_aa4HND@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/23 Peter Korsgaard <jacmet@sunsite.dk>:
> ---
> ?CHANGES ? ? ? ? ? ? ? ? ? ? | ? ?9 +++++----
> ?package/makedevs/makedevs.c | ? 18 +++++++++++++-----
> ?2 files changed, 18 insertions(+), 9 deletions(-)
>

Please, Peter, split actual code patch and CHANGES modification in
individual commits. Else it will break backporting through git
cherry-pick, and even future backporting on arbitrary forks.

Best regards
Daniel
