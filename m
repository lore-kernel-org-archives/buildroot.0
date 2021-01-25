From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jan 2021 14:47:56 +0200
Subject: [Buildroot] defining two repos for a pkg
In-Reply-To: <trinity-9605111f-3dc9-4bd6-91f8-b125249edd32-1611578631798@3c-app-mailcom-bs07>
References: <trinity-9605111f-3dc9-4bd6-91f8-b125249edd32-1611578631798@3c-app-mailcom-bs07>
Message-ID: <87eei9chdv.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dagg,

On Mon, Jan 25 2021, daggs wrote:
> I have a pkg that requires files from two different git repos, is
> there such support for it in buildroot?

Does <pkg>_EXTRA_DOWNLOADS help?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
