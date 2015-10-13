From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Oct 2015 14:33:38 -0300
Subject: [Buildroot] [PATCH] busybox: bump to version 1.24.0
In-Reply-To: <561D3FB2.1020007@zacarias.com.ar>
References: <1444732120-14687-1-git-send-email-Vincent.Riera@imgtec.com>
 <561D3FB2.1020007@zacarias.com.ar>
Message-ID: <561D4072.6050206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/15 14:30, Gustavo Zacarias wrote:

> On 13/10/15 07:28, Vicente Olivert Riera wrote:
>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Big NACK, it doesn't build with any uclibc-based toolchain by default.
> CONFIG_SYNC_FANCY is 'default y' now and that requires syncfs() support.
> The best solution is likely to be disabling fancy sync in the default
> busybox config shipped in BR.
> Regards.

Rushy mail to avoid that getting applied, it's CONFIG_FEATURE_SYNC_FANCY.
Regards.
