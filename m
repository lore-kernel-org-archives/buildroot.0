From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 25 Mar 2020 16:55:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-03-24
In-Reply-To: <20200325072537.2D102881F9@hemlock.osuosl.org>
References: <20200325072537.2D102881F9@hemlock.osuosl.org>
Message-ID: <20200325165512.309a226b@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On Wed, 25 Mar 2020 07:25:30 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Autobuild statistics for 2020-03-24
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2019.02.x  | 20  |  4  |  0  | 24  |
>   2019.11.x  |  9  |  9  |  0  | 18  |
>   2020.02.x  | 11  |  5  |  0  | 16  |
>     master   | 89  | 57  |  0  | 146 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
[...]
>          python-markdown-3.2.1 | 3 
[...]
> 
> 
> Detail of failures
> ------------------
> 
>     arch     |             reason             | OK?
> |
> url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
[...]
> | powerpc64le  |     python-markdown-3.2.1      | NOK |
> http://autobuild.buildroot.net/results/8890d81c4dfe8a702faf3a1436c3fa643c1da764
> | x86_64    |     python-markdown-3.2.1      | NOK |
> http://autobuild.buildroot.net/results/3506737cc84fe8fb809cc277aa4a547db289d0cc
> | arm      |     python-markdown-3.2.1      | NOK |
> http://autobuild.buildroot.net/results/80da724dbe96219905255b9b1bf9e020e849900d
fixed by http://patchwork.ozlabs.org/project/buildroot/list/?series=163410
[...] 
