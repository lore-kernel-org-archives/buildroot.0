From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Mar 2021 20:53:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build when time_t
 is defined as long long
In-Reply-To: <20210304122925.1609049-1-fontaine.fabrice@gmail.com>
References: <20210304122925.1609049-1-fontaine.fabrice@gmail.com>
Message-ID: <261a1401-5b8f-ee38-7fb1-25a179b31c54@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/03/2021 13:29, Fabrice Fontaine wrote:
> On some platforms time_t is defined as long long. At the moment, the
> compilation of sqlite3_column_as<time_t>(...) fails on these systems
> because the appropriate getter is not defined
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3a76afdbd8b564579bfb08a4d75b438dbd73ac2e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout
