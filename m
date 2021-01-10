From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Jan 2021 11:47:03 +0200
Subject: [Buildroot] [PATCH v3 02/11] boot/mv-ddr-marvell: Bump to HEAD
 as of 20201207
In-Reply-To: <cGJJkB-og8Jn4-_QkIs51CQXDaGcbNU611Z7EItf9_VAvIcfmnDOq2ikgutqZVlNQXds65qfBwogvb6QZhYswMLsMeb-evjf_8NEAJsqVok=@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-3-hi@senzilla.io> <X/mwVYvTNW+tGYiV@curiosity>
 <cGJJkB-og8Jn4-_QkIs51CQXDaGcbNU611Z7EItf9_VAvIcfmnDOq2ikgutqZVlNQXds65qfBwogvb6QZhYswMLsMeb-evjf_8NEAJsqVok=@senzilla.io>
Message-ID: <8735z9yvhk.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dick, Sergey,

On Sun, Jan 10 2021, D. Olsson via buildroot wrote:
> On Saturday, January 9, 2021 1:32 PM, Sergey Matyukevich <geomatsi@gmail.com> wrote:
>> If so, then I would suggest to revert this particular commit.
>> Let me know if you have any objections for this change.
>
> May I propose that we "roll-forward" instead, and update all
> Marvell defconfigs to use mainline ATF instead? I believe this
> would add the most value for Buildroot users, having access to
> the latest and most stable fixes. What do you think?
>
> I'll submit a patch for comments in the next day or so!

Note that commit 6f0d85fe7e6e6 ("configs/solidrun_clearfog_gt_8k: bump
BSP components") fixed the Clearfog GT-8K defconfig.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
