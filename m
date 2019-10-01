From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 1 Oct 2019 10:09:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-28
In-Reply-To: <20190929061737.3832520472@silver.osuosl.org>
References: <20190929061737.3832520472@silver.osuosl.org>
Message-ID: <24942c53-13f4-333a-9a22-cb83ec3f6b07@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 9/29/19 8:17 AM, Thomas Petazzoni wrote:
> 
> Results for branch '2019.05.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>            libtorrent-rasterbar | 1
>     openvmtools-10.3.5-10430147 | 1
> 
> 
> Detail of failures
> ------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> microblazeel |      libtorrent-rasterbar      | TIM | http://autobuild.buildroot.net/results/e10f4d28702292c4656c1c2b02ca64c39f84b50a |

This is fixed by this patch:
https://patchwork.ozlabs.org/patch/1117726/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
